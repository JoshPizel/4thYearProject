Attribute VB_Name = "TE_BAS"
Option Explicit
Global Kill_Calculations As Integer
Global Mass() As Single
Global K() As Single
Global I1() As Single
Global J1() As Single
Global X_Pos() As Single
Global Y_Pos() As Single

Sub Plot_Time_Evolution()
  Dim N As Integer
  Dim M As Long
  Dim N1 As Integer
  Dim M1 As Long
  Dim N2 As Integer
  Dim M2 As Long
  Dim I As Long
  Dim Time_Increment As Long
  Dim I1_Min As Single
  Dim I1_Max As Single
  Dim J1_Min As Single
  Dim J1_Max As Single
  Dim Mass_Min As Single
  Dim Mass_Max As Single
  Dim Mass_Number_X As Integer
  Dim Mass_Number_Y As Integer
  Dim Mass_Number As Integer
  Dim Point_Number As Long
  Dim S_Width As Single
  Dim S_Height As Single
  Dim Time_Pointer As Long
  Dim A_String As String
  Dim Offset_X As Single
  Dim Offset_Y As Single
  Dim Profile As String
  Kill_Calculations = 0
  TE.Picture1.Cls
  TE.Picture1.AutoRedraw = True
  S_Width = TE.Picture1.ScaleWidth
  S_Height = TE.Picture1.ScaleHeight
  On Error Resume Next
    MkDir "C:\Mass Spring Data\Images\"
    Kill "C:\Mass Spring Data\Images\*.*"
  On Error GoTo 0
  Close 1
  Dim Image_Counter As Integer
  Image_Counter = 10
  Open "C:\Mass Spring Data\Mass Position.txt" For Input As #1
    Input #1, Profile
    ' Unstructured or polar grid
    Input #1, Mass_Number_X
    Input #1, Mass_Number_Y
    ReDim I1(Mass_Number_X, Mass_Number_Y) As Single
    ReDim J1(Mass_Number_X, Mass_Number_Y) As Single
    ReDim X_Pos(Mass_Number_X, Mass_Number_Y) As Single
    ReDim Y_Pos(Mass_Number_X, Mass_Number_Y) As Single
    ReDim Mass(Mass_Number_X, Mass_Number_Y) As Single
    Mass_Min = 1E+20
    Mass_Max = -1E+20
    Input #1, Offset_X
    Input #1, Offset_Y
    For N = 1 To Mass_Number_X Step 1
      For M = 1 To Mass_Number_Y Step 1
        Input #1, Mass(N, M)
        Input #1, I1(N, M)
        Input #1, J1(N, M)
        If I1(N, M) < I1_Min Then I1_Min = I1(N, M)
        If I1(N, M) > I1_Max Then I1_Max = I1(N, M)
        If J1(N, M) < J1_Min Then J1_Min = J1(N, M)
        If J1(N, M) > J1_Max Then J1_Max = J1(N, M)
        If Mass(N, M) < Mass_Min Then Mass_Min = Mass(N, M)
        If Mass(N, M) > Mass_Max Then Mass_Max = Mass(N, M)
      Next M
    Next N
    If Mass_Min = Mass_Max Then Mass_Max = Mass_Min + 1
    ReDim K(Mass_Number_X, Mass_Number_Y, Mass_Number_X, Mass_Number_Y) As Single
    For N1 = 1 To Mass_Number_X Step 1
      For M1 = 1 To Mass_Number_Y Step 1
        For N2 = 1 To Mass_Number_X Step 1
          For M2 = 1 To Mass_Number_Y Step 1
            Input #1, K(N1, M1, N2, M2)
          Next M2
        Next N2
      Next M1
    Next N1
    Input #1, Point_Number
    Input #1, Time_Increment
    TE.Text1.Text = Point_Number
    For I = 1 To (Point_Number - 1) / Time_Increment Step 1
      TE.Picture1.Picture = LoadPicture("")
      For N = 1 To Mass_Number_X Step 1
        For M = 1 To Mass_Number_Y Step 1
          Input #1, Time_Pointer
          Input #1, A_String 'I1(N, M)
          Input #1, A_String 'J1(N, M)
          Input #1, X_Pos(N, M)
          Input #1, Y_Pos(N, M)
        Next M
      Next N
      TE.Text2.Text = Time_Pointer
      For N1 = 1 To Mass_Number_X Step 1
        For M1 = 1 To Mass_Number_Y Step 1
          For N2 = 1 To Mass_Number_X Step 1
            For M2 = 1 To Mass_Number_Y Step 1
              If K(N1, M1, N2, M2) <> 0 Then
                TE.Picture1.DrawWidth = 1
                TE.Picture1.PSet (S_Width / (I1_Max + Offset_X) * (I1(N1, M1) + X_Pos(N1, M1)), S_Height - S_Height / (J1_Max + Offset_Y) * (J1(N1, M1) + Y_Pos(N1, M1))), RGB(0, 0, 255)
                TE.Picture1.Line -(S_Width / (I1_Max + Offset_X) * (I1(N2, M2) + X_Pos(N2, M2)), S_Height - S_Height / (J1_Max + Offset_Y) * (J1(N2, M2) + Y_Pos(N2, M2))), RGB(0, 0, 255)
              End If
            Next M2
          Next N2
        Next M1
      Next N1
      For N = 1 To Mass_Number_X Step 1
        For M = 1 To Mass_Number_Y Step 1
          If Mass(N, M) <> 0 Then
            TE.Picture1.DrawWidth = 12 - 5 * (Mass_Max - Mass(N, M)) / (Mass_Max - Mass_Min)
            TE.Picture1.PSet (S_Width / (I1_Max + Offset_X) * (I1(N, M)), S_Height - S_Height / (J1_Max + Offset_Y) * (J1(N, M))), RGB(0, 255, 0)
            TE.Picture1.PSet (S_Width / (I1_Max + Offset_X) * (I1(N, M) + X_Pos(N, M)), S_Height - S_Height / (J1_Max + Offset_Y) * (J1(N, M) + Y_Pos(N, M))), RGB(255, 0, 0)
          End If
        Next M
      Next N
      TE.Picture1.Refresh
      DoEvents
      If Kill_Calculations = 1 Then Exit For
      If Int(I / Image_Counter) * Image_Counter = I Then
        SavePicture TE.Picture1.Image, "C:\Mass Spring Data\Images\" & Profile & " " & Int(I) & ".bmp"
      End If
    Next I
    TE.Picture1.AutoRedraw = False
  Close 1
End Sub

Sub Play_Video()
  Dim Profile As String
  Dim I As Long
  Profile = "Random"
  On Error GoTo No_More_Images:
  I = 0
  Do
    I = I + 10
    TE.Picture1.Picture = LoadPicture("C:\Mass Spring Data\Images\" & Profile & " " & Int(I) & ".bmp")
  Loop
No_More_Images:
  On Error GoTo 0
End Sub
