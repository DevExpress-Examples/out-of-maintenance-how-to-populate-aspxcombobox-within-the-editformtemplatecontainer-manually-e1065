<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ComboPopulate._Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web"
	TagPrefix="dxwgv" %>
<%@ register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web"
	TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dxwgv:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
			DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" OnHtmlEditFormCreated="ASPxGridView1_HtmlEditFormCreated" OnRowUpdating="ASPxGridView1_RowUpdating" OnCancelRowEditing="ASPxGridView1_CancelRowEditing">
<Templates>
  <EditForm>
   <table>
	 <tr>
	   <td>
		 CategoryName:
	   </td>
	   <td>
		   <dxe:ASPxLabel id="catLab" runat="server" Text='<%#Eval("CategoryName")%>'></dxe:ASPxLabel>
	   </td>
	 </tr>
	 <tr>
	   <td>
		 Description:
	   </td>
	   <td>
		   <dxe:aspxcombobox ID="descrBox" runat="server"></dxe:aspxcombobox>
	   </td>
	 </tr>
   </table>
   <dxwgv:aspxgridviewtemplatereplacement ReplacementType="EditFormUpdateButton" ID="Update" runat="server">
   </dxwgv:aspxgridviewtemplatereplacement>
   <dxwgv:aspxgridviewtemplatereplacement ReplacementType="EditFormCancelButton" ID="Cancel" runat="server">
   </dxwgv:aspxgridviewtemplatereplacement>
</EditForm>
</Templates>
<Columns>
	<dxwgv:gridviewcommandcolumn VisibleIndex="0">
		<editbutton Visible="True">
		</editbutton>
	</dxwgv:gridviewcommandcolumn>
<dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="3"></dxwgv:GridViewDataTextColumn>
</Columns>
</dxwgv:aspxgridview>

	</div>
		<asp:accessdatasource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT * FROM [Categories]" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?" InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ?, [Picture] = ? WHERE [CategoryID] = ?">
			<deleteparameters>
				<asp:parameter Name="CategoryID" Type="Int32" />
			</deleteparameters>
			<updateparameters>
				<asp:parameter Name="CategoryName" Type="String" />
				<asp:parameter Name="Description" Type="String" />
				<asp:parameter Name="Picture" Type="Object" />
				<asp:parameter Name="CategoryID" Type="Int32" />
			</updateparameters>
			<insertparameters>
				<asp:parameter Name="CategoryID" Type="Int32" />
				<asp:parameter Name="CategoryName" Type="String" />
				<asp:parameter Name="Description" Type="String" />
				<asp:parameter Name="Picture" Type="Object" />
			</insertparameters>
		</asp:accessdatasource>
	</form>
</body>
</html>