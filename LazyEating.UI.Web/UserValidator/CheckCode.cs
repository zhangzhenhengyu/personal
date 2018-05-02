using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;

//namespace LazyEating.UI.Web.UserValidator
//{
public class CheckCode
{
    public static void DrawImage()
    {
        CheckCode img = new CheckCode();
        HttpContext.Current.Session["CheckCode"] = img.RndNum(4);
        img.checkCodes(HttpContext.Current.Session["CheckCode"].ToString());
    }

    private void checkCodes(string checkCode)
    {
        int iwidth = (checkCode.Length * 13);
        Bitmap image = new Bitmap(iwidth, 23);
        Graphics graphics = Graphics.FromImage(image);
        graphics.Clear(Color.White);
        Color[] c = {
                        Color.Black, Color.Red, Color.DarkBlue, Color.Green, Color.Orange, Color.Brown, Color.DarkCyan,
                        Color.Purple
                    };
        string[] font = { "Verdana", "Microsoft Sans Serif", "Comic Sans MS", "Arial", "宋体" };
        Random rand = new Random();
        for (int i = 0; i < 50; i++)
        {
            int x = rand.Next(image.Width);
            int y = rand.Next(image.Height);
            graphics.DrawRectangle(new Pen(Color.LightGray, 0), x, y, 1, 1);
        }
        for (int i = 0; i < checkCode.Length; i++)
        {
            int cindex = rand.Next(7);
            int findex = rand.Next(5);

            Font f = new Font(font[findex], 10, FontStyle.Bold);
            Brush b = new SolidBrush(c[cindex]);
            int ii = 4;
            if ((i + 1) % 2 == 0)
            {
                ii = 2;
            }
            graphics.DrawString(checkCode.Substring(i, 1), f, b, 3 + (i * 12), ii);
        }
        graphics.DrawRectangle(new Pen(Color.Black, 0), 0, 0, image.Width - 1, image.Height - 1);
        MemoryStream ms = new MemoryStream();
        image.Save(ms, ImageFormat.Jpeg);
        HttpContext.Current.Response.ClearContent();
        HttpContext.Current.Response.ContentType = "image/Jpeg";
        HttpContext.Current.Response.BinaryWrite(ms.ToArray());
        graphics.Dispose();
        image.Dispose();
    }

    private string RndNum(int VcodeNum)
    {
        string Vchar = "0,1,2,3,4,5,6,7,8,9";
        string[] VcArray = Vchar.Split(',');
        string VNum = "";
        int temp = -1;
        Random rand = new Random();
        for (int i = 1; i < VcodeNum + 1; i++)
        {
            if (temp != -1)
            {
                rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
            }
            int t = rand.Next(VcArray.Length);
            if (temp != -1 && temp == t)
            {
                return RndNum(VcodeNum);
            }
            temp = t;
            VNum += VcArray[t];
        }
        return VNum;
    }

}
//}