using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.UI;

public partial class UserValidator_NumAndLetCheckCode : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateCheckCodeImage(GenerateCheckCode());
    }

    private string GenerateCheckCode()
    {
        int number;
        char code;
        string checkCode = String.Empty;

        Random random = new Random();

        for (int i = 0; i < 4; i++)
        {
            number = random.Next();

            if (number%2 == 0)
                code = (char) ('0' + (char) (number%10));
            else
                code = (char) ('A' + (char) (number%26));

            checkCode += code.ToString();
        }

        Response.Cookies.Add(new HttpCookie("CheckCode", checkCode));

        return checkCode;
    }

    private void CreateCheckCodeImage(string checkCode)
    {
        if (String.IsNullOrEmpty(checkCode))
        {
            return;
        }

        Bitmap bitmap = new Bitmap((int) Math.Ceiling((checkCode.Length*18.0)), 32);
        Graphics graphics = Graphics.FromImage(bitmap);

        try
        {
            Random random = new Random();
            graphics.Clear(Color.White);
            for (int i = 0; i < 2; i++)
            {
                int x1 = random.Next(bitmap.Width);
                int x2 = random.Next(bitmap.Width);
                int y1 = random.Next(bitmap.Height);
                int y2 = random.Next(bitmap.Height);

                graphics.DrawLine(new Pen(Color.Black), x1, y1, x2, y2);
            }

            Font font = new Font("Arial", 18, (FontStyle.Bold));
            LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, bitmap.Width, bitmap.Height),
                                                                Color.Blue, Color.DarkRed, 1.2f, true);
            graphics.DrawString(checkCode, font, brush, 2, 2);

            for (int i = 0; i < 100; i++)
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
        finally
        {
            graphics.Dispose();
            bitmap.Dispose();
        }
    }
}