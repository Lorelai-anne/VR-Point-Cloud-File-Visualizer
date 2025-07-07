﻿// SPDX-License-Identifier: MIT
// The authors below grant copyright rights under the MIT license:
// Copyright (c) 2019-2023 Nick Klingensmith
// Copyright (c) 2023 Qualcomm Technologies, Inc.

using RAZR_PointCRep;
using StereoKit;
using System;
using System.Collections.Generic;

class ShowAssets : IClass
{
    string title = "Asset Enumeration";
    string description = "If you need to take a peek at what's currently loaded, StereoKit has a couple tools in the Assets class!\n\nThis demo is just a quick illustration of how to enumerate through your Assets.";

    /// :CodeSample: Assets Assets.Type
    /// ### Simple Asset Browser
    /// A full asset browser might have a few more features, but here's a quick
    /// and dirty window that will provide a filtered list of the current
    /// live assets!
    ///
    /// ![An overly simple asset browser window]({{site.screen_url}}/TinyAssetBrowser.jpg)
    List<IAsset> filteredAssets = new List<IAsset>();
    Type filterType = typeof(IAsset);
    Pose filterWindow = (Matrix.TR(0, -0.1f, -0.6f, Quat.LookDir(0, 0, 1))).Pose;
    float filterScroll = 0;
    const int filterScrollCt = 12;

    void UpdateFilter(Type type)
    {
        filterType = type;
        filterScroll = 0.0f;
        filteredAssets.Clear();


        // Here's where the magic happens! `Assets.Type` can take a Type, or a
        // generic <T>, and will give a list of all assets that match that
        // type!
        filteredAssets.AddRange(Assets.Type(filterType));
    }

    public void AssetWindow()
    {
        UISettings settings = UI.Settings;
        float height = filterScrollCt * (UI.LineHeight + settings.gutter) + settings.margin * 2;
        UI.WindowBegin("Asset Browser", ref filterWindow, V.XY(0.5f, height));

        UI.LayoutPushCut(UICut.Left, 0.08f);
        UI.PanelAt(UI.LayoutAt, UI.LayoutRemaining);

        UI.Label("Filter");

        UI.HSeparator();

        // A radio button selection for what to filter by
        Vec2 size = new Vec2(0.08f, 0);
        if (UI.Radio("Model", filterType == typeof(Model), size)) UpdateFilter(typeof(Model));
        UI.SameLine();
        if (UI.Radio("All", filterType == typeof(IAsset), size)) UpdateFilter(typeof(IAsset));

        UI.LayoutPop();

        UI.LayoutPushCut(UICut.Right, UI.LineHeight);
        UI.VSlider("scroll", ref filterScroll, 0, Math.Max(0, filteredAssets.Count - 3), 1, 0, UIConfirm.Pinch);
        UI.LayoutPop();


        // We can visualize some of these assets, and just draw a label for
        // some others.
        for (int i = (int)filterScroll; i < Math.Min(filteredAssets.Count, (int)filterScroll + filterScrollCt); i++)
        {
            IAsset asset = filteredAssets[i];
            UI.PushId(i);
            switch (asset)
            {
                case Model item: VisualizeModel(item); break;
            }
            UI.PopId();
            if (UI.Button(string.IsNullOrEmpty(asset.Id) ? "(null)" : asset.Id, V.XY(UI.LayoutRemaining.x, 0)))
            {
                Model model = Model.FromFile(string.IsNullOrEmpty(asset.Id) ? "(null)" : asset.Id);
                model.Draw(Matrix.T(0.2f, 0, 0));
            }
        }
        UI.WindowEnd();
    }

    void VisualizeMesh(Mesh item)
    {
        Bounds meshSize = item.Bounds;
        Bounds b = UI.LayoutReserve(V.XX(UI.LineHeight), false, UI.LineHeight);
        float scale = (1.0f / meshSize.dimensions.Length);
        item.Draw(Material.Default, Matrix.TS(b.center + meshSize.center * scale, b.dimensions * scale));

        UI.SameLine();
    }

    void VisualizeMaterial(Material item)
    {
        // Default Materials have a number of special effect shaders that don't
        // visualize in a generic way.
        if (!string.IsNullOrEmpty(item.Id) && (item.Id.StartsWith("render/") || item.Id.StartsWith("default/")))
            return;

        Bounds b = UI.LayoutReserve(V.XX(UI.LineHeight), false, UI.LineHeight);
        Mesh.Sphere.Draw(item, Matrix.TS(b.center, b.dimensions));

        UI.SameLine();
    }

    void VisualizeSprite(Sprite item)
    {
        UI.Image(item, V.XX(UI.LineHeight));
        UI.SameLine();
    }

    void VisualizeModel(Model item)
    {
        UI.Model(item, V.XX(UI.LineHeight));
        UI.SameLine();
    }

    void VisualizeSound(Sound item)
    {
        if (UI.Button(">", V.XX(UI.LineHeight)))
            item.Play(Hierarchy.ToWorld(UI.LayoutLast.center));
        UI.SameLine();
    }
    /// :End:

    public void Initialize()
    {
        UpdateFilter(typeof(Mesh));

        /// :CodeSample: Assets Assets.All
        /// ### Enumerating all Assets
        /// With Assets.All, you can take a peek at all the currently loaded
        /// Assets! Here's a quick example of iterating through all assets and
        /// dumping a quick summary to the log.
        foreach (var asset in Assets.All)
            Log.Info($"{asset.GetType().Name,-10} - {asset.Id}");
        /// :End:

        MenuSort.RunForFrames(2);
    }

    public void Shutdown() { }

    public void Step()
    {
        AssetWindow();
    }
}