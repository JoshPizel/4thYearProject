VERSION 5.00
Begin VB.Form Window 
   Caption         =   "2D Mass Simulation"
   ClientHeight    =   8415
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   15375
   LinkTopic       =   "Form1"
   ScaleHeight     =   8415
   ScaleWidth      =   15375
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton StopButton 
      Caption         =   "Stop"
      Height          =   375
      Left            =   4680
      TabIndex        =   3
      Top             =   120
      Width           =   1575
   End
   Begin VB.CommandButton StartButton 
      Caption         =   "Start"
      Height          =   375
      Left            =   2760
      TabIndex        =   2
      Top             =   120
      Width           =   1575
   End
   Begin VB.PictureBox Drawspace 
      Height          =   7695
      Left            =   120
      ScaleHeight     =   7635
      ScaleWidth      =   14955
      TabIndex        =   0
      Top             =   600
      Width           =   15015
   End
   Begin VB.Label Title 
      Caption         =   "2D Mass Simulation"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   2175
   End
End
Attribute VB_Name = "Window"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Label1_Click()

End Sub

Private Sub Drawspace_Click()

End Sub

Private Sub StartButton_Click()

End Sub
