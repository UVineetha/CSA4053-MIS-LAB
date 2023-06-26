Imports System.Data.SqlClient
Imports System.Windows

Public Class Form1
    Dim conn As New SqlConnection
    Dim cmd As New SqlCommand
    Dim dt As DataTable
    Dim dr As SqlDataReader
    Dim da As New SqlDataAdapter
    Dim str As String
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        conn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\USER\source\repos\Demo1\Demo1\demo1.mdf;Integrated Security=True"
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        conn.Open()
        str = "Select * from Demo1 where username='" & TextBox1.Text & "' and password ='" & TextBox2.Text & "'"
        cmd = New SqlCommand(str, conn)
        da = New SqlDataAdapter(cmd)
        dt = New DataTable
        da.Fill(dt)
        If (dt.Rows.Count > 0) Then
            MsgBox("Entry accessed")
            Me.Show()
        Else
            MsgBox("Invalid username & password")
        End If
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        conn.Close()
    End Sub
End Class
