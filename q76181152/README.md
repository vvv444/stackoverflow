The fact that your controls are windowless, doesn't prevent you from doing that. You just have to ensure that you are sending the messages to the container window (the one that has its `hWnd` handle).

I tested the following code on VB6 app with windowless button. For me it simulates the click even for minimized window. The trick is to first send `WM_ACTIVATE` message, then `WM_LBUTTONDOWN/UP pair`:

```
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

```

See [this repo](https://github.com/vvv444/stackoverflow/q76181152/`) for working code example.
Run `WLTest.exe` and minimize it's window. Then run the C# code and ensure the counter indeed increments in the VB6 window.