@using (Html.BeginForm("FileUpload", "Home", FormMethod.Post, new { enctype = "multipart/form-data" }))
{ 
 @Html.ValidationSummary();
 <ol>
 <li class="lifile">
 <input type="file" id="fileToUpload" name="file" />
 <span class="field-validation-error" id="spanfile"></span>
 </li>
 </ol>
 <input type="submit" id="btnSubmit" value="Upload" />
}