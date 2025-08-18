using Android.Util;
using Org.Apache.Http.Impl.Conn;
using RAZR_PointCRep.Tools;
using StereoKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Android.Media.TV.TvContract.Channels;

namespace RAZR_PointCRep.Show
{
    internal class Welcome : IClass
    {
        bool winEn = false;

        string message = "Welcome to Resonant Sciences point cloud representation program!";
        string message2 = "Take some time to place some spatial nodes!\nYou can move the cube by pinching and show a hand menu by raising your left hand";
        public void Initialize()
        {
        }
        float Hslider = 0.5f;
        int radioOption = 1;
        public void Step()
        {
            
            Text.Add("Welcome to Resonant Sciences point cloud representation application!", Matrix.TR(0, -.05f, -1.5f, Quat.LookDir(0,0,1)));
            Text.Add("Take some time to place some spatial nodes", Matrix.TR(0, -.1f, -1.5f, Quat.LookDir(0, 0, 1)));
            Text.Add("You can move the cube by pinching and show a hand menu by raising your left hand", Matrix.TR(0, -.15f, -1.5f, Quat.LookDir(0, 0, 1)));



            Handed handed = Handed.Left;

            if (!HandFacingHead(handed)) //if palm not facing head, skip window
                return;

            // Decide the size and offset of the menu
            Vec2 size = new Vec2(4, 16);
            float offset = handed == Handed.Left ? -2 - size.x : 2 + size.x;

            // Position the menu relative to the side of the hand
            Hand hand = Input.Hand(handed);
            Vec3 at = hand[FingerId.Little, JointId.KnuckleMajor].position;
            Vec3 down = hand[FingerId.Little, JointId.Root].position;
            Vec3 across = hand[FingerId.Index, JointId.KnuckleMajor].position;

            Pose menuPose = new Pose(
                at,
                Quat.LookAt(at, across, at - down) * Quat.FromAngles(0, handed == Handed.Left ? 90 : -90, 0));
            menuPose.position += menuPose.Right * offset * 0.03f;
            menuPose.position += menuPose.Up * (size.y / 2) * U.cm;

            UI.WindowBegin("UI Tutorial", ref menuPose);
            {
                UI.Text("This is a hand menu, in all of your classes a hand menu exists. Stereokit is a built with hand use in mind, so try out some of UI used in the proejct");
                UI.PanelBegin();
                UI.HSlider("Horizontal Slider", ref Hslider, 0, 1, 0);

                if (UI.Radio("Opt1", radioOption == 1)) radioOption = 1;
                UI.SameLine();
                if (UI.Radio("Opt2", radioOption == 2)) radioOption = 2;
                UI.SameLine();
                if (UI.Radio("Opt3", radioOption == 3)) radioOption = 3;

                UI.PanelEnd();
            }
            UI.WindowEnd();
        }

        public void Shutdown()
        {
        }

        static bool HandFacingHead(Handed handed)
        {
            Hand hand = Input.Hand(handed);
            if (!hand.IsTracked)
                return false;

            Vec3 palmDirection = hand.palm.Forward.Normalized;
            Vec3 directionToHead = (Input.Head.position - hand.palm.position).Normalized;

            return Vec3.Dot(palmDirection, directionToHead) > 0.5f;
        }
    }
}
