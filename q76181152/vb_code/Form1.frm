VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3135
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3135
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin MSWLess.WLText WLText1 
      Height          =   1695
      Left            =   2400
      TabIndex        =   1
      Top             =   480
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   2990
      _Version        =   393216
      Text            =   "0"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLCommand WLCommand1 
      Height          =   735
      Left            =   240
      TabIndex        =   0
      Top             =   600
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   1296
      _Version        =   393216
      Caption         =   "WL Increment"
      ForeColor       =   -1
      BackColor       =   -2147483633
      Appearance      =   1
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub WLCommand1_Click()
    WLText1.Text = CInt(WLText1.Text) + 1
End Sub
