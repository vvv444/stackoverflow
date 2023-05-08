using System.Runtime.InteropServices;

// Win32 API definitions
[DllImport("user32.dll", EntryPoint = "FindWindow")]
static extern IntPtr FindWindowByCaption(IntPtr ZeroOnly, string lpWindowName);

[DllImport("user32.dll")]
static extern int PostMessage(IntPtr hWnd,  uint Msg, int wParam, int lParam);


const uint WM_ACTIVATE = 0x0006;
const uint WM_LBUTTONDOWN = 0x201;
const uint WM_LBUTTONUP = 0x202;

const int MK_LBUTTON = 1;

const int WA_ACTIVE = 1;

int MAKELPARAM(int p, int p_2)
{
    return ((p_2 << 16) | (p & 0xFFFF));
}

// The code
IntPtr hWnd = FindWindowByCaption(IntPtr.Zero, "Form1");

Thread.Sleep(3000);

PostMessage(hWnd, WM_ACTIVATE, WA_ACTIVE, 0);

int lParam = MAKELPARAM(62, 68); // Button coordinates relative to window "client area"
PostMessage(hWnd, WM_LBUTTONDOWN, MK_LBUTTON, lParam);
PostMessage(hWnd, WM_LBUTTONUP, 0, lParam);
