using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DataAccess;

namespace BusinessLogic
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            OrchestraLogic ol = new OrchestraLogic();

            System.Diagnostics.Debug.WriteLine(ol.getAllOrchestra().Count);

            Orchestra or = new Orchestra();
            or.OfficialName = "from entitiy model";
            ol.addOrchestra(or);
        }
    }
}
