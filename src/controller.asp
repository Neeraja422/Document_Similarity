[HttpPost]
public ActionResult FileUpload(HttpPostedFileBase file)
{
 if (ModelState.IsValid)
 {
 if (file == null)
 {
 ModelState.AddModelError("File", "Please Upload Your file");
 }
 else if (file.ContentLength > 0)
 {
 int MaxContentLength = 1024 * 1024 * 3; //3 MB
 string[] AllowedFileExtensions = new string[] { ".jpg", ".gif", ".png", ".pdf" };
 
 if (!AllowedFileExtensions.Contains(file.FileName.Substring(file.FileName.LastIndexOf('.'))))
 {
 ModelState.AddModelError("File", "Please file of type: " + string.Join(", ", AllowedFileExtensions));
 }
 
 else if (file.ContentLength > MaxContentLength)
 {
 ModelState.AddModelError("File", "Your file is too large, maximum allowed size is: " + MaxContentLength + " MB");
 }
 else
 {
 //TO:DO
 var fileName = Path.GetFileName(file.FileName);
 var path = Path.Combine(Server.MapPath("~/Content/Upload"), fileName);
 file.SaveAs(path);
 ModelState.Clear();
 ViewBag.Message = "File uploaded successfully";
 }
 }
 }
 return View();
}