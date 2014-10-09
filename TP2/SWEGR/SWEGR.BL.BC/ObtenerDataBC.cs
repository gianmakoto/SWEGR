using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using mshtml;
using System.Threading;
using SWEGR.BL.BE;
using HtmlAgilityPack;
using System.IO;
using System.Net;
using System.Drawing;

namespace SWEGR.BL.BC
{
    public class ObtenerDataBC
    {
        string url_LinkedIn = "https://www.linkedin.com";
        string url_Fb = "https://www.facebook.com";

        public Boolean autenticarse_LinkedIn(String usuario, String password, SHDocVw.InternetExplorer IE)
        {
            try
            {

                IE.Navigate(url_LinkedIn);
                while (IE.Busy)
                {
                    Thread.Sleep(2000);
                }
                Thread.Sleep(1000);
                mshtml.HTMLInputElement username = IE.Document.GetElementById("session_key-login");
                if (username != null)
                {
                    username.value = usuario;
                    mshtml.HTMLInputElement pass = IE.Document.GetElementById("session_password-login");
                    pass.value = password;
                    HTMLInputElement click = IE.Document.GetElementById("signin");
                    Thread.Sleep(2000);
                    int cont = 0;
                    while (true)
                    {
                        cont++;
                        if (cont == 99999999)
                            break;
                    }
                    click.click();
                }
                else
                {
                    Thread.Sleep(2000);
                    logOut_LinkedIn(IE);
                    //Thread.Sleep(2000);
                    while (IE.Busy)
                    {
                        Thread.Sleep(2000);

                    }
                    IE.Navigate(url_LinkedIn);
                    while (IE.Busy)
                    { }
                    username = IE.Document.GetElementById("session_key-login");
                    if (username != null)
                    {
                        username.value = usuario;
                        mshtml.HTMLInputElement pass = IE.Document.GetElementById("session_password-login");
                        pass.value = password;
                        HTMLInputElement click = IE.Document.GetElementById("signin");
                        Thread.Sleep(2000);
                        click.click();
                    }
                }
                while (IE.Busy)
                { }
                return true;

            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Cannot implicitly convert type 'System.DBNull' to 'mshtml.HTMLInputElement'"))
                {
                    Thread.Sleep(2000);
                    logOut_LinkedIn(IE);
                    while (IE.Busy)
                    {
                        Thread.Sleep(2000);

                    }
                    IE.Navigate(url_LinkedIn);
                    while (IE.Busy)
                    {
                        Thread.Sleep(2000);

                    }
                    Thread.Sleep(2000);
                    mshtml.HTMLInputElement username = IE.Document.GetElementById("session_key-login");
                    username = IE.Document.GetElementById("session_key-login");

                    if (username != null)
                    {
                        username.value = usuario;
                        mshtml.HTMLInputElement pass = IE.Document.GetElementById("session_password-login");
                        pass.value = password;
                        HTMLInputElement click = IE.Document.GetElementById("signin");
                        Thread.Sleep(2000);
                        click.click();
                        while (IE.Busy)
                        {
                            Thread.Sleep(2000);

                        }
                        Thread.Sleep(2000);
                        return true;
                    }
                    return false;
                }
                else
                {
                    return false;
                }
            }
        }

        public Boolean logOut_LinkedIn(SHDocVw.InternetExplorer IE)
        {
            try
            {
                String linkLogOut = "";
                foreach (IHTMLElement element in IE.Document.GetElementsByTagName("a"))
                {
                    if (element.outerHTML != null && element.outerHTML.Contains("account-submenu-split-link"))
                    {
                        linkLogOut = element.getAttribute("href");
                        break;
                    }
                }

                if (!linkLogOut.Trim().Equals(""))
                {
                    IE.Navigate(linkLogOut);
                    while (IE.Busy)
                    {
                        Thread.Sleep(2000);
                    }
                    IE.Navigate(url_LinkedIn);

                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        public void extraerDatos_Lista(SHDocVw.InternetExplorer IE, List<String> listaProfiles)
        {
            HTMLDocument doc2 = null;
            string html;
            foreach (String profile in listaProfiles)
            {
                Thread.Sleep(2000);
                while (IE.Busy)
                { }
                IE.Navigate(profile);
                while (IE.Busy)
                { }
                Thread.Sleep(2000);
                doc2 = null;
                while (doc2 == null)
                {
                    try
                    {
                        doc2 = IE.Document as mshtml.HTMLDocument;
                    }
                    catch (Exception ex)
                    {

                    }
                }
                html = doc2.body.outerHTML;
                HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                doc.OptionFixNestedTags = true;
                doc.LoadHtml(html);
                List<RegistroLaboralBE> listaRegistroLaboral = obtenerRegistrosLaborales(doc);
                List<RegistroAcademicoBE> listaRegistroAcademico = obtenerRegistrosAcademicos(doc);
                EgresadoBE datosUsuario = obtenerDatosGenerales(doc);
                List<String> listaIntereses = obtenerIntereses(doc);
                List<String> listaAptitudes = obtenerAptitudes(doc);
            }

        }

        public Boolean autenticarse_Facebook(String usuario, String password, SHDocVw.InternetExplorer IE)
        {
            try
            {
                while (IE.Busy)
                {
                    Thread.Sleep(2000);

                }
                IE.Navigate(url_Fb);
                while (IE.Busy)
                {
                    Thread.Sleep(2000);
                }
                // Thread.Sleep(2500);
                mshtml.HTMLInputElement username = IE.Document.GetElementById("email");
                if (username != null)
                {
                    username.value = usuario;
                    mshtml.HTMLInputElement pass = IE.Document.GetElementById("pass");
                    pass.value = password;
                    HTMLInputElement click = IE.Document.GetElementById("u_0_l");
                    Thread.Sleep(2000);
                    int cont = 0;
                    while (true)
                    {
                        cont++;
                        if (cont == 99999999)
                            break;
                    }
                    click.click();
                }
                else
                {
                    Thread.Sleep(2000);
                    logOut_Facebook(IE);
                    Thread.Sleep(2000);
                    while (IE.Busy)
                    { }
                    username = IE.Document.GetElementById("email");
                    if (username != null)
                    {
                        username.value = usuario;
                        mshtml.HTMLInputElement pass = IE.Document.GetElementById("pass");
                        pass.value = password;
                        HTMLInputElement click = IE.Document.GetElementById("u_0_l");
                        Thread.Sleep(2000);
                        click.click();
                    }
                }
                while (IE.Busy)
                { }
                return true;

            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Cannot implicitly convert type 'System.DBNull' to 'mshtml.HTMLInputElement'"))
                {
                    Thread.Sleep(2000);
                    logOut_Facebook(IE);
                    while (IE.Busy)
                    { }
                    Thread.Sleep(2000);
                    mshtml.HTMLInputElement username = IE.Document.GetElementById("email");

                    if (username != null)
                    {
                        username.value = usuario;
                        mshtml.HTMLInputElement pass = IE.Document.GetElementById("pass");
                        pass.value = password;
                        HTMLInputElement click = IE.Document.GetElementById("u_0_l");
                        Thread.Sleep(2000);
                        click.click();
                        while (IE.Busy)
                        { }
                        Thread.Sleep(2000);
                        return true;
                    }
                    return false;
                }
                else
                {
                    return false;
                }
            }
        }

        public Boolean logOut_Facebook(SHDocVw.InternetExplorer IE)
        {
            try
            {
                Boolean encontro = false;
                foreach (IHTMLElement element in IE.Document.GetElementsByTagName("input"))
                {
                    if (element.outerHTML != null && element.outerHTML.Contains("Salir"))
                    {
                        element.click();
                        Thread.Sleep(2000);
                        encontro = true;
                        break;
                    }
                }

                if (encontro)
                    return true;
                return false;

            }
            catch (Exception ex)
            {
                throw;
            }
        }



        public DatosObtenidosBE extraerDatos_Personal_LinkedIn(SHDocVw.InternetExplorer IE, String profile)
        {

            try
            {
                HTMLDocument doc2 = null;
                string html;
                while (IE.Busy)
                { }
                IE.Navigate(profile);
                while (IE.Busy)
                { }
                Thread.Sleep(2000);
                doc2 = null;
                Thread.Sleep(2000);
                while (doc2 == null)
                {
                    try
                    {
                        doc2 = IE.Document as mshtml.HTMLDocument;
                    }
                    catch (Exception ex)
                    {

                    }
                }
                Thread.Sleep(1000);

                html = doc2.body.outerHTML;


                HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                doc.OptionFixNestedTags = true;
                doc.LoadHtml(html);

                List<RegistroLaboralBE> listaRegistroLaboral = obtenerRegistrosLaborales(doc);
                List<RegistroAcademicoBE> listaRegistroAcademico = obtenerRegistrosAcademicos(doc);
                EgresadoBE datosUsuario = obtenerDatosGenerales(doc);
                List<String> listaIntereses = obtenerIntereses(doc);
                List<String> listaAptitudes = obtenerAptitudes(doc);

                if (listaRegistroLaboral == null && listaRegistroAcademico == null && datosUsuario == null && listaIntereses == null && listaAptitudes == null)
                {

                    return null;
                }
                else
                {
                    DatosObtenidosBE datosReturn = new DatosObtenidosBE();
                    datosReturn.DatosUsuario = datosUsuario;
                    datosReturn.ListaAptitudes = listaAptitudes;
                    datosReturn.ListaIntereses = listaIntereses;
                    datosReturn.ListaRegistroAcademico = listaRegistroAcademico;
                    datosReturn.ListaRegistroLaboral = listaRegistroLaboral;
                    return datosReturn;
                }

            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public String[] extraerDatos_Personal_Facebook(SHDocVw.InternetExplorer IE, String profile)
        {

            try
            {
                HTMLDocument doc2 = null;
                string html;
                while (IE.Busy)
                {
                    Thread.Sleep(1000);

                }
                IE.Navigate(profile);
                while (IE.Busy)
                {
                    Thread.Sleep(2000);
                }
                Thread.Sleep(1000);

                doc2 = null;
                Thread.Sleep(2000);
                while (doc2 == null)
                {
                    try
                    {
                        doc2 = IE.Document as mshtml.HTMLDocument;
                    }
                    catch (Exception ex)
                    {

                    }
                }

                Thread.Sleep(1000);
                html = doc2.body.outerHTML;


                HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                doc.OptionFixNestedTags = true;
                doc.LoadHtml(html);

                String[] datos = obtenerDatosPersonales_Fb(doc);

                return datos;

            }
            catch (Exception ex)
            {
                return null;
            }

        }
        public List<RegistroLaboralBE> obtenerRegistrosLaborales(HtmlAgilityPack.HtmlDocument doc)
        {
            try
            {
                List<RegistroLaboralBE> listaRegistroLaboral = new List<RegistroLaboralBE>();


                HtmlNode experiencia = doc.DocumentNode.SelectSingleNode(".//div[@id='background-experience']");
                if (experiencia != null)
                {

                    HtmlNodeCollection items_experiencias = experiencia.SelectNodes(".//div[contains(@class,'editable-item section-item')]");

                    RegistroLaboralBE registro;

                    foreach (HtmlNode item in items_experiencias)
                    {
                        registro = new RegistroLaboralBE();

                        HtmlNode h4 = item.SelectSingleNode(".//h4");
                        if (h4 != null)
                        {
                            HtmlNode cargo = h4.SelectSingleNode(".//a");
                            if (cargo != null)
                                registro.Cargotrabajo = cargo.InnerText;
                        }

                        HtmlNode h5 = item.SelectSingleNode(".//h5");
                        if (h5 != null)
                        {
                            HtmlNode nombreTrabajo = h5.SelectSingleNode(".//a");
                            if (nombreTrabajo != null)
                                registro.Nombretrabajo = nombreTrabajo.InnerText;
                        }

                        HtmlNode span = item.SelectSingleNode(".//time");
                        if (span != null)
                            registro.Duraciontrabajo = span.ParentNode.InnerText;

                        HtmlNode descripcion = item.SelectSingleNode(".//p[@class='description']");
                        if (descripcion != null)
                            registro.Descripciontrabajo = descripcion.InnerText;


                        listaRegistroLaboral.Add(registro);
                    }

                    return listaRegistroLaboral;
                }
                else
                    return null;

            }
            catch (Exception ex)
            {
                throw;
            }

        }


        public List<RegistroAcademicoBE> obtenerRegistrosAcademicos(HtmlAgilityPack.HtmlDocument doc)
        {
            try
            {
                List<RegistroAcademicoBE> listaRegistroAcademico = new List<RegistroAcademicoBE>();

                HtmlNode container = doc.DocumentNode.SelectSingleNode(".//div[@id='background-education']");
                if (container != null)
                {
                    HtmlNodeCollection items = container.SelectNodes(".//div[@class='editable-item section-item']");

                    RegistroAcademicoBE registro;
                    foreach (HtmlNode item in items)
                    {
                        registro = new RegistroAcademicoBE();

                        HtmlNode h4 = item.SelectSingleNode(".//h4");
                        if (h4 != null)
                        {
                            HtmlNode institucion = h4.SelectSingleNode(".//a");
                            if (institucion != null)
                                registro.Nombreinstitucion = institucion.InnerText;
                        }

                        HtmlNode header = item.SelectSingleNode(".//header");
                        if (header != null)
                        {
                            HtmlNode h5 = header.SelectSingleNode(".//h5");
                            if (h5 != null)
                            {
                                HtmlNode tipoEstudio = h5.SelectSingleNode(".//span[@class='degree']");
                                if (tipoEstudio != null)
                                    registro.Tipoestudio = tipoEstudio.InnerText;

                                HtmlNode nombreEstudio = h5.SelectSingleNode(".//span[@class='major']");
                                if (nombreEstudio != null)
                                    registro.Nombreestudio = nombreEstudio.InnerText;
                            }
                        }

                        HtmlNode span = item.SelectSingleNode(".//time");
                        if (span != null)
                            registro.Duracionestudio = span.ParentNode.InnerText;

                        HtmlNode descripcion = item.SelectSingleNode(".//p[@class='notes']");
                        if (descripcion != null)
                            registro.Descripcionestudio = descripcion.InnerText;


                        listaRegistroAcademico.Add(registro);
                    }
                    return listaRegistroAcademico;

                }
                else
                    return null;
            }
            catch (Exception ex)
            {
                return null;
            }

        }


        public EgresadoBE obtenerDatosGenerales(HtmlAgilityPack.HtmlDocument doc)
        {
            try
            {
                EgresadoBE usuarioObtenido = null;

                HtmlNode container = doc.DocumentNode.SelectSingleNode(".//div[@class='profile-card-extras']");
                if (container != null)
                {
                    usuarioObtenido = new EgresadoBE();

                    HtmlNode correo = container.SelectSingleNode(".//a[contains(@href,'mailto')]");
                    if (correo != null)
                        usuarioObtenido.Correoegresado = correo.InnerText;

                    HtmlNode telefono = container.SelectSingleNode(".//div[@id='phone-view']");
                    if (telefono != null)
                    {
                        usuarioObtenido.Telefonoprinegresado = formatearString(telefono.InnerText);
                    }


                    HtmlNode direccion = container.SelectSingleNode(".//div[@id='address-view']");
                    if (direccion != null)
                        usuarioObtenido.Direccionegresado = direccion.InnerText;

                    HtmlNode container_img = doc.DocumentNode.SelectSingleNode(".//div[@class='profile-picture']");
                    if (container_img != null)
                    {
                        HtmlNode img = container_img.SelectSingleNode(".//img");
                        if (img != null)
                        {
                            //usuarioObtenido.Fotoegresado = img.Attributes["src"].Value;
                            return usuarioObtenido;
                        }
                    }

                }
                return usuarioObtenido;




            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        public List<String> obtenerIntereses(HtmlAgilityPack.HtmlDocument doc)
        {
            try
            {

                List<String> listaIntereses = null;

                HtmlNode container = doc.DocumentNode.SelectSingleNode(".//ul[@class='interests-listing']");
                if (container != null)
                {
                    listaIntereses = new List<String>();
                    HtmlNodeCollection items = container.SelectNodes(".//a");
                    if (items != null)
                    {
                        foreach (HtmlNode item in items)
                        {
                            listaIntereses.Add(formatearString_Aptitudes(item.InnerText));

                        }
                    }

                }
                return listaIntereses;


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public List<String> obtenerAptitudes(HtmlAgilityPack.HtmlDocument doc)
        {
            try
            {

                List<String> listaAptitudes = null;

                HtmlNode container = doc.DocumentNode.SelectSingleNode(".//ul[@class='skills-section compact-view']");
                if (container != null)
                {
                    listaAptitudes = new List<String>();
                    HtmlNodeCollection items = container.SelectNodes(".//li");
                    if (items != null)
                    {
                        foreach (HtmlNode item in items)
                        {

                            listaAptitudes.Add(formatearString_Aptitudes(item.InnerText));

                        }
                    }

                    container = doc.DocumentNode.SelectSingleNode(".//ul[@class='skills-section']");
                    if (container != null)
                    {
                        HtmlNodeCollection items_extras = container.SelectNodes(".//li[@class='endorse-item no-endorsements ']");
                        if (items_extras != null)
                        {
                            foreach (HtmlNode item in items_extras)
                            {
                                listaAptitudes.Add(formatearString_Aptitudes(item.InnerText));
                            }
                        }
                    }
                }

                return listaAptitudes;


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public String[] obtenerDatosPersonales_Fb(HtmlAgilityPack.HtmlDocument doc)
        {
            try
            {

                String[] datosFB = new String[6];
                HtmlNode container = doc.DocumentNode.SelectSingleNode(".//div[@class='_4bl9 _zu9']");
                if (container != null)
                {
                    HtmlNodeCollection items = container.SelectNodes(".//li[@class='_4tnv _2pif']");
                    if (items != null)
                    {
                        int i = 0;
                        foreach (HtmlNode item in items)
                        {

                            HtmlNode span = item.SelectSingleNode(".//span[@class='_c24 _50f3']");
                            if (!span.InnerText.Contains("Preguntar"))
                                datosFB[i] = formatearString(span.InnerText);
                            else
                                datosFB[i] = "";

                            i++;
                        }
                    }

                }
                return datosFB;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public byte[] obtenerImagen(HtmlAgilityPack.HtmlDocument doc)
        {
            try
            {
                String urlImage = "";
                HtmlNode container = doc.DocumentNode.SelectSingleNode(".//div[@class='profile-picture']");
                if (container != null)
                {
                    HtmlNode img = container.SelectSingleNode(".//img");
                    if (img != null)
                    {
                        urlImage = img.Attributes["src"].Value;
                    }
                }

                byte[] data = null;
                data = ReadFile_Image(urlImage);
                return data;


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }




        //Open file in to a filestream and read data in a byte array.
        public byte[] ReadFile_Image(string URL)
        {


            //Initialize byte array with a null value initially.
            byte[] data = null;

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
            WebResponse response = request.GetResponse();
            using (Stream stream = response.GetResponseStream())
            using (BinaryReader br = new BinaryReader(stream))
            {
                data = br.ReadBytes(500000);
                br.Close();
            }

            /* using (FileStream fs = File.OpenWrite(path + nombreImagen + ".jpg"))
             {
                 byte[] bytes = new byte[1024];
                 int count;
                 while ((count = stream.Read(bytes, 0, bytes.Length)) != 0)
                 {
                     fs.Write(bytes, 0, count);
                 }
             }*/

            /*   //Use FileInfo object to get file size.
               FileInfo fInfo = new FileInfo(sPath);
               long numBytes = fInfo.Length;

               //Open FileStream to read file
               FileStream fStream = new FileStream(sPath, FileMode.Open, FileAccess.Read);

               //Use BinaryReader to read file stream into byte array.
               BinaryReader br = new BinaryReader(fStream);

               //When you use BinaryReader, you need to supply number of bytes 
               //to read from file.
               //In this case we want to read entire file. 
               //So supplying total number of bytes.
               data = br.ReadBytes((int)numBytes);
               */
            return data;
        }




        //When user changes row selection, display image of selected row in picture box.
        /* private void dataGridView1_CellEnter(object sender, DataGridViewCellEventArgs e)
         {
             try
             {
                 //Get image data from gridview column.
                 byte[] imageData =
             (byte[])dataGridView1.Rows[e.RowIndex].Cells["ImageData"].Value;

                 //Initialize image variable
                 Image newImage;
                 //Read image data into a memory stream
                 using (MemoryStream ms = new MemoryStream(imageData, 0, imageData.Length))
                 {
                     ms.Write(imageData, 0, imageData.Length);

                     //Set image variable value using memory stream.
                     newImage = Image.FromStream(ms, true);
                 }

                 //set picture
                 pictureBox1.Image = newImage;
             }
             catch (Exception ex)
             {
                 MessageBox.Show(ex.ToString());
             }
         }
         */

        public String formatearString_Aptitudes(string texto)
        {
            texto = texto.Replace("0", "");
            texto = texto.Replace("\r\n", "");
            texto = texto.Replace("&nbsp;", " ");
            return texto;
        }
        public String formatearString(string texto)
        {
            texto.Replace("&nbsp;", " ");
            texto = texto.Replace("\r\n", "");
            texto = texto.Replace("&nbsp;", " ");
            return texto;
        }

        //Devuelve el codigo HTML de un archivo HTML
        public string getContenidoHTML(string pathHTML)
        {
            //leer codigo HTML del archivo del pathHTML
            string html = File.ReadAllText(pathHTML);
            return html;
        }
    }
}
