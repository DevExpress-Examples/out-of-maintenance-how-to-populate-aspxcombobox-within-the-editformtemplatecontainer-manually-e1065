Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web

Namespace ComboPopulate
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

		End Sub

		Protected Sub ASPxGridView1_HtmlEditFormCreated(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewEditFormEventArgs)
			If Session("isEditForCreated") Is Nothing Then
				Dim currentBox As ASPxComboBox = TryCast((CType(sender, ASPxGridView)).FindEditFormTemplateControl("descrBox"), ASPxComboBox)
				Dim index As Integer = (CType(sender, ASPxGridView)).EditingRowVisibleIndex
				Dim currentKey As Integer = Convert.ToInt32((CType(sender, ASPxGridView)).GetRowValues(index, "CategoryID"))
				For i As Integer = 1 To 9
					currentBox.Items.Add("Description" & i.ToString())

				Next i
				currentBox.SelectedIndex = currentKey - 1
			End If
			Session("isEditForCreated") = True

		End Sub

		Protected Sub ASPxGridView1_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
			Dim currentBox As ASPxComboBox = TryCast((CType(sender, ASPxGridView)).FindEditFormTemplateControl("descrBox"), ASPxComboBox)
			e.NewValues("Description") = currentBox.Value.ToString()
			Session.Clear()
		End Sub

		Protected Sub ASPxGridView1_CancelRowEditing(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs)
			Session.Clear()
		End Sub
	End Class
End Namespace
