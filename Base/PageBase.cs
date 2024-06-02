using System;
using System.Web;
using ASF.BusinessObjects;
using ASF.DataAccess.Repositories;
using ASF.Interfaces;
using TGS.Common;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using TGS.Utilities.Enums;

namespace ASF.Web
{
    public class PageBase : System.Web.UI.Page
    {
        protected User CurrentUser
        {
            get
            {
                return IoC.Resolve<IUserService>().GetByUserName(HttpContext.Current.User.Identity.Name);
            }
        }

        private IRepository _repository;
        protected IRepository Repository
        {
            get
            {
                if (_repository != null)
                    return _repository;
                else
                {
                    _repository = IoC.Resolve<IRepository>();
                    return _repository;
                }
            }
        }

        //protected T InstanceFromFactory<T>()
        //{
        //    return IoC.Resolve<T>();

        //    //Dictionary<string, object> _serviceCache = Session["_serviceCache"] as Dictionary<string, object>;
        //    //if (_serviceCache == null)
        //    //    _serviceCache = new Dictionary<string, object>();

        //    //string key = typeof(T).Name;

        //    //if (_serviceCache.ContainsKey(key))
        //    //    return (T)_serviceCache[key];
        //    //else
        //    //{
        //    //    object instance = IoC.Resolve<T>();
        //    //    _serviceCache[key] = instance;
        //    //    Session["_serviceCache"] = _serviceCache;
        //    //    return (T)instance;
        //    //}
        //}
        
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            RegisterStartupScripts();
        }

        protected void LoadEnumDropdown<T>(ref DropDownList dropdown)
        {
            LoadEnumDropdown<T>(ref dropdown, false);
        }
        protected void LoadEnumDropdown<T>(ref DropDownList dropdown, bool insertBlankItem)
        {
            List<EnumWrapper<T>> items = EnumWrapper<T>.CreateWrappers();

            dropdown.Items.Clear();
            foreach (var item in items)
            {
                ListItem li = new ListItem();
                li.Value = item.IntValue.ToString();
                li.Text = item.Description;

                dropdown.Items.Add(li);
            }

            if (insertBlankItem)
            {
                dropdown.Items.Insert(0, new ListItem("", "-1"));
            }
        }

        private void RegisterStartupScripts()
        {
            string strJS = @"<script type='text/javascript'>
                $(document).ready(function ()
                {
                    $('.numeric').numeric();
                    $('.integer').numeric(false, null);
                });
            </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "jqueryNumeric", strJS);
        }
    }
}
