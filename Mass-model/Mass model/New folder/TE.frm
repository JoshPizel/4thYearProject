VERSION 5.00
Begin VB.Form TE 
   BackColor       =   &H0000FFFF&
   Caption         =   "Time Evolution"
   ClientHeight    =   10995
   ClientLeft      =   225
   ClientTop       =   510
   ClientWidth     =   12900
   LinkTopic       =   "Form1"
   ScaleHeight     =   10995
   ScaleWidth      =   20250
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "Play video"
      Height          =   255
      Left            =   10200
      TabIndex        =   6
      Top             =   120
      Width           =   2175
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   7680
      TabIndex        =   5
      Top             =   240
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   6120
      TabIndex        =   4
      Top             =   240
      Width           =   1455
   End
   Begin VB.CommandButton Command3 
      Caption         =   "END"
      Height          =   375
      Left            =   4320
      TabIndex        =   3
      Top             =   120
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Stop"
      Height          =   495
      Left            =   2760
      TabIndex        =   2
      Top             =   120
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000007&
      Height          =   10935
      Left            =   120
      ScaleHeight     =   10875
      ScaleWidth      =   12195
      TabIndex        =   1
      Top             =   840
      Width           =   12255
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Plot"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2415
   End
End
Attribute VB_Name = "TE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Call Plot_Time_Evolution
End Sub

Private Sub Command2_Click()
  Kill_Calculations = 1
End Sub

Private Sub Command3_Click()
  End
End Sub

Private Sub Command4_Click()
  Call Play_Video
End Sub

