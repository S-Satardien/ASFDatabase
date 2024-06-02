using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using ASF.BusinessObjects;
using TGS.Common;
using ASF.Interfaces;
using ASF.DataAccess.Repositories;

namespace ASF.Web
{
    public class ControlBase : UserControl
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
    }
}