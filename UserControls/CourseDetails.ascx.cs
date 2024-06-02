using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TGS.Utilities;

namespace ASF.Web.UserControls
{
    public partial class CourseDetails : System.Web.UI.UserControl
    {
        public delegate void SaveClick_Handler();
        public event SaveClick_Handler OnSave_Click;

        public string CourseName
        {
            get
            {
                return txtCourseName.Text;
            }
            set
            {
                txtCourseName.Text = value;
            }
        }

        public int CourseType
        {
            get
            {
                return Parsing.ParseInt(ddCourseType.SelectedValue);
            }
            set
            {
                ddCourseType.SelectedValue = value.ToString();
            }
        }

        public int CourseLevel
        {
            get
            {
                return Parsing.ParseInt(ddCourseLevel.SelectedValue);
            }
            set
            {
                ddCourseLevel.SelectedValue = value.ToString();
            }
        }

        public int PayCycles
        {
            get
            {
                return Parsing.ParseInt(txtPaycycles.Text);
            }
            set
            {
                txtPaycycles.Text = value.ToString();
            }
        }

        public decimal CourseCost
        {
            get
            {
                return Parsing.ParseDecimal(txtCourseCost.Text);
            }
            set
            {
                txtCourseCost.Text = value.ToString("0.00");
            }
        }

        public bool FullTime
        {
            get
            {
                return cbFulltime.Checked;
            }
            set
            {
                cbFulltime.Checked = value;
            }
        }

        public bool ShowSaveButton
        {
            set
            {
                pnlSave.Visible = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.OnSave_Click.Invoke();
        }
    }
}
