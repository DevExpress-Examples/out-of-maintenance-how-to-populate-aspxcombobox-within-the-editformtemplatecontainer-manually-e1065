using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

namespace ComboPopulate
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            if (Session["isEditForCreated"] == null)
            {
                ASPxComboBox currentBox = ((ASPxGridView)sender).FindEditFormTemplateControl("descrBox") as ASPxComboBox;
                int index = ((ASPxGridView)sender).EditingRowVisibleIndex;
                int currentKey = Convert.ToInt32(((ASPxGridView)sender).GetRowValues(index, "CategoryID"));
                for (int i = 1; i <= 9; i++)
                {
                    currentBox.Items.Add("Description" + i.ToString());

                }
                currentBox.SelectedIndex = currentKey - 1;
            }
            Session["isEditForCreated"] = true;
           
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxComboBox currentBox = ((ASPxGridView)sender).FindEditFormTemplateControl("descrBox") as ASPxComboBox;
            e.NewValues["Description"] = currentBox.Value.ToString();
            Session.Clear();
        }

        protected void ASPxGridView1_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session.Clear();
        }
    }
}
