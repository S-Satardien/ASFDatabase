using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TGS.Common;
using ASF.Interfaces;
using System.Web.UI.WebControls;

namespace ASF.Web.UserControls
{
    public partial class MenuControl : ControlBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenu();
            }
        }

        private void LoadMenu()
        {
            List<ASF.BusinessObjects.Menu> items = IoC.Resolve<IMenuService>().GetUserMenuItems(CurrentUser.UserID);

            MainMenu.Items.Clear();
            foreach (var userItem in items)
            {
                MenuItem item = CreateItem(userItem);
                MainMenu.Items.Add(item);
            }
        }

        private MenuItem CreateItem(ASF.BusinessObjects.Menu userItem)
        {
            MenuItem item = new MenuItem();
            item.Text = userItem.Description;
            item.NavigateUrl = userItem.Url;

            if (userItem.Items.Count > 0)
            {
                foreach (var childItem in userItem.Items)
                {
                    item.ChildItems.Add(CreateItem(childItem));
                }
            }
            return item;
        }
    }
}
