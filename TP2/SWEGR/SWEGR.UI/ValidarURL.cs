using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Text.RegularExpressions;

namespace SWEGR.UI
{
    public class ValidarURL
    {
        public bool ValidateUrl(string url)
        {
            if (url == null || url == "") return false;

            Regex oRegExp = new Regex(@"(http|ftp|https)://([\w-]+\.)+(/[\w- ./?%&=]*)?", RegexOptions.IgnoreCase);
            return oRegExp.Match(url).Success;

            bool algo;

            algo = oRegExp.Match(url).Success;

            return algo;
        }
    }
}