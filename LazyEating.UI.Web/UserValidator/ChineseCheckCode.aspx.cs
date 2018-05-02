using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;

public partial class UserValidator_ChineseCheckCode : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GraphicsImage(4);
    }

    private object[] CreateString(int strlength)
    {
        string[] str = new string[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" };
        Random ran = new Random();
        object[] bytes = new object[strlength];
        for (int i = 0; i < strlength; i++)
        {
            int ran1 = ran.Next(11, 14);
            string str1 = str[ran1].Trim();
            ran = new Random(ran1*unchecked((int) DateTime.Now.Ticks) + i);
            int ran2;
            if (ran1 == 13)
            {
                ran2 = ran.Next(0, 7);
            }
            else
            {
                ran2 = ran.Next(0, 16);
            }
            string str2 = str[ran2].Trim();
            ran = new Random(ran2*unchecked((int) DateTime.Now.Ticks) + i);
            int ran3 = ran.Next(10, 16);
            string str3 = str[ran3].Trim();
            ran = new Random(ran3*unchecked((int) DateTime.Now.Ticks) + i);
            int ran4;
            if (ran3 == 10)
            {
                ran4 = ran.Next(1, 16);
            }
            else if (ran3 == 15)
            {
                ran4 = ran.Next(0, 15);
            }
            else
            {
                ran4 = ran.Next(0, 16);
            }
            string str4 = str[ran4].Trim();
            byte byte1 = Convert.ToByte(str1 + str2, 16);
            byte byte2 = Convert.ToByte(str3 + str4, 16);
            byte[] stradd = new[] {byte1, byte2};
            bytes.SetValue(stradd, i);
        }
        return bytes;
    }

    private string GetString(int length)
    {
        Encoding encoding = Encoding.GetEncoding("gb2312");
        object[] bytes = CreateString(length);
        string str1 = encoding.GetString((byte[]) Convert.ChangeType(bytes[0], typeof (byte[])));
        string str2 = encoding.GetString((byte[]) Convert.ChangeType(bytes[1], typeof (byte[])));
        string str3 = encoding.GetString((byte[]) Convert.ChangeType(bytes[2], typeof (byte[])));
        string str4 = encoding.GetString((byte[]) Convert.ChangeType(bytes[3], typeof (byte[])));
        string str = str1 + str2 + str3 + str4;
        Response.Cookies.Add(new HttpCookie("CheckCode", str));
        return str;
    }

    // 图片验证码高度为 22px
    private void GraphicsImage(int length)
    {
        Bitmap bitmap = new Bitmap((int) Math.Ceiling((GetString(length).Length*22.5)), 22);
        Graphics graphics = Graphics.FromImage(bitmap); //创建画布

        try
        {
            Random random = new Random();
            graphics.Clear(Color.White);
            for (int i = 0; i < 1; i++)
            {
                int x1 = random.Next(bitmap.Width);
                int x2 = random.Next(bitmap.Width);
                int y1 = random.Next(bitmap.Height);
                int y2 = random.Next(bitmap.Height);

                graphics.DrawLine(new Pen(Color.Black), x1, y1, x2, y2);
            }

            Font font = new Font("Couriew New", 12, FontStyle.Bold);
            LinearGradientBrush brush = new LinearGradientBrush
                (new Rectangle(0, 0, bitmap.Width, bitmap.Height), Color.Blue, Color.DarkRed, 1.2f, true);
            graphics.DrawString(GetString(length), font, brush, 2, 2);

            for (int i = 0; i < 50; i++)
            {
                int x = random.Next(bitmap.Width);
                int y = random.Next(bitmap.Height);

                bitmap.SetPixel(x, y, Color.FromArgb(random.Next()));
            }

            graphics.DrawRectangle(new Pen(Color.Silver), 0, 0, bitmap.Width - 1, bitmap.Height - 1);
            MemoryStream ms = new MemoryStream();
            bitmap.Save(ms, ImageFormat.Gif);
            Response.ClearContent();
            Response.ContentType = "image/Gif";
            Response.BinaryWrite(ms.ToArray());
        }
        catch (Exception ms)
        {
            Response.Write(ms.Message);
        }
    }
}