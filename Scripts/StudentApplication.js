$(document).ready(function ()
{
    BuildReports(studentApplicationYear - 1);
    BuildReports(studentApplicationYear);

    window.scrollTo = function () { };

    BindEnterKeyToReport(6, studentApplicationYear - 1);
    BindEnterKeyToReport(12, studentApplicationYear - 1);

    BindEnterKeyToReport(6, studentApplicationYear);
    BindEnterKeyToReport(12, studentApplicationYear);
});


function BindEnterKeyToReport(semester, year)
{
    $('#inpMark_' + semester + '_' + year).live("keypress", function (e)
    {
        if (e.which == 13)
        {
            AddSubject(semester, year);
        }
    });
}


function ShowSubjectMarks_Popup(studentID, institutionCourseID, period, year, month)
{
	var params = '{studentID:' + studentID + ', institutionCourseID:' + institutionCourseID + ', period:\'' + period + '\', year:' + year + ', month:' + month + ' }';

	$("#tblSubjectMarks").html("");
	$("#dvSubjectMarkDetails").attr("title", "Student Marks - " + period);

	var dialog = $("#dvSubjectMarkDetails").dialog({ resizable: false, width: "400px", modal: true });
	dialog.parent().appendTo($("form:first"));

	$("#dvSubjectMarksLoading").show();
	$("#dvSubjectMarkDetails :submit").hide();
	$("#dvSubjectMarksLoading label").text("Loading...");

	$.ajax({
	    type: "POST",
	    url: "Student_ApplicationDetails.aspx/GetPeriodSubjectMarks",
	    data: params,
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    success: function (data)
	    {
	        var json = jQuery.parseJSON(data.d);

	        BuildSubjectMarks_Popup(json);
	        initNumericTextboxes();
	        $("#dvSubjectMarksLoading").hide();
	        $("#dvSubjectMarkDetails :submit").show();
	    }
	});

	return false;
}

function BuildSubjectMarks_Popup(data)
{
	var tblSubjectMarks = $("#tblSubjectMarks");

	$(tblSubjectMarks).html("");
	var tr = $("<tr></tr>").attr("class", "gridHeader subjectMarksGridHeader");
	$(tr).attr("StudentID", data[0].StudentID);
	$(tr).attr("InstitutionCourseID", data[0].InstitutionCourseID);
	$(tr).attr("Subject", data[0].Subject);
	$(tr).attr("Year", data[0].Year);
	$(tr).attr("Month", data[0].Month);

	$("<td>Subject</td>").css("width", "120px").appendTo(tr);
	$("<td>Mark</td>").css("width", "120px").appendTo(tr);

	$(tr).appendTo(tblSubjectMarks);


	//English
	tr = $("<tr></tr>");
	$('<td><label>English</label></td>').appendTo(tr);

	var td = $("<td></td>");

	var mark = (data[0].English == null) ? '' : data[0].English;
	var txt = $('<input type="text" class="textbox English numeric" maxlength="3" maxvalue="100" id="txtEnglishMark" value="' + mark + '">');
	$(txt).appendTo(td);
	$(td).appendTo(tr);
	$(tr).appendTo(tblSubjectMarks);

	//Maths
	tr = $("<tr></tr>");
	$('<td><label>Maths</label></td>').appendTo(tr);

	td = $("<td></td>");
	mark = (data[0].Maths == null) ? '' : data[0].Maths;
	txt = $('<input type="text" class="textbox Maths numeric" maxlength="3" maxvalue="100" id="txtMathsMark" value="' + mark + '">');
	$(txt).appendTo(td);
	$(td).appendTo(tr);
	$(tr).appendTo(tblSubjectMarks);

	//Average
	tr = $("<tr></tr>");
	$('<td><label>Average</label></td>').appendTo(tr);

	td = $("<td></td>");
	mark = (data[0].Average == null) ? '' : data[0].Average;
	txt = $('<input type="text" class="textbox Avg numeric" maxlength="3" maxvalue="100" id="txtAverage" value="' + mark + '">');
	$(txt).appendTo(td);
	$(td).appendTo(tr);
	$(tr).appendTo(tblSubjectMarks);

	//SubjectsOver50
	tr = $("<tr></tr>");
	$('<td><label>Subjects Over 50%</label></td>').appendTo(tr);

	td = $("<td></td>");
	mark = (data[0].SubjectsOver50 == null) ? '' : data[0].SubjectsOver50;
	txt = $('<input type="text" class="textbox SubjectsOver50 numeric" maxlength="2" maxvalue="12" id="txtSubjectsOver50" value="' + mark + '">');
	$(txt).appendTo(td);
	$(td).appendTo(tr);
	$(tr).appendTo(tblSubjectMarks);

	//TotalSubjects
	tr = $("<tr></tr>");
	$('<td><label>Total Subjects</label></td>').appendTo(tr);

	td = $("<td></td>");
	mark = (data[0].TotalSubjects == null) ? '' : data[0].TotalSubjects;
	txt = $('<input type="text" class="textbox TotalSubjects numeric" maxlength="2" maxvalue="12" id="txtTotalSubjects" value="' + mark + '">');
	$(txt).appendTo(td);
	$(td).appendTo(tr);
	$(tr).appendTo(tblSubjectMarks);
}

function btnSaveSubjectMarks_Click()
{
	$("#dvSubjectMarksLoading").show();
	$("#dvSubjectMarksLoading label").text("Saving data...");

	var inputs = $(".textbox");
	var header = $(".subjectMarksGridHeader:first");
	var counter = 0;

	var studentID = $(header).attr("StudentID");
	var InstitutionCourseID = $(header).attr("InstitutionCourseID");
	var year = $(header).attr("Year");
	var month = $(header).attr("Month");

	var english = $(".English:first").val();
	var maths = $(".Maths:first").val();
	var average = $(".Avg:first").val();
	var subjectsOver50 = $(".SubjectsOver50:first").val();
	var totalSubjects = $(".TotalSubjects:first").val();


	var params = '{studentID:' + studentID + ', InstitutionCourseID:' + InstitutionCourseID + ', year:' + year + ', month:' + month + ', English:\'' + english + '\', Maths:\'' + maths + '\', Average:\'' + average + '\', SubjectsOver50:\'' + subjectsOver50 + '\', TotalSubjects:\'' + totalSubjects + '\' }';

	$.ajax({
		type: "POST",
		url: "Student_ApplicationDetails.aspx/UpdatePeriodSubjectMark",
		data: params,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (data)
		{
			$("#dvSubjectMarksLoading").hide();

			__doPostBack("btnSaveSubjectMarks", "");
		}
	});

	return false;
}

function lbShowJunReport_Click(year)
{
	var dialog = $("#dvResults_6_" + year).dialog({ resizable: false, width: "400px", modal: true });
	dialog.parent().appendTo($("form:first"));

	runNumericFunctions();
	
	return false;
}

function lbShowDecReport_Click(year)
{
    var dialog = $("#dvResults_12_" + year).dialog({ resizable: false, width: "400px", modal: true });
    dialog.parent().appendTo($("form:first"));
    return false;
}

function lbShowCurrentYearReport_Click(semester, year)
{
    var dialog = $("#dvResults_" + semester + "_" + year).dialog({ resizable: false, width: "400px", modal: true });
    dialog.parent().appendTo($("form:first"));

    runNumericFunctions();
    
    return false;
}

function runNumericFunctions()
{
    $('[id*=inpMark_]').numeric();
    $('[id*=inpMark_]').jStepper({ minValue: 0, maxValue: 100 });
}

function BuildReports(year)
{
    BuildReport(6, year);
    BuildReport(12, year);
}

var hasExistingSubjects = true;

function BuildReport(semester, year)
{
    var divID = 'dvResults_' + semester + '_' + year;

    SetReportData();
    hasExistingSubjects = HasExistingSubjects();
    $('#' + divID).append(ExistingSubjects(semester, year));

    if (institutionBlocked != "True") {
        $('#' + divID).append(AdditionalSubjects(semester, year));
    }

    runNumericFunctions();
}

function RefreshReport(semester, year)
{
    var divID = 'dvResults_' + semester + '_' + year;

    $('#' + divID).find('.conatiner').remove();

    manageReportData = originalReportData;
    $('#' + divID).append(ExistingSubjects(semester, year));
    $('#' + divID).append(AdditionalSubjects(semester, year));

    runNumericFunctions();
}

var originalReportData;
var manageReportData;

function SetReportData()
{
    originalReportData = JSON.parse(reportData);
    manageReportData = originalReportData;
}

function HasExistingSubjects()
{
    if (originalReportData.Data.length < 1) return false;
    return true;
}

function AdditionalSubjects(month, year)
{
    month = parseInt(month);
    var additionalSubj = "<table class='conatiner'>";

    var subjStr = "<select id='slcSubject_" + month + '_' + year + "' style='width:291px;'>";

    for (var z = 0; z < manageReportData.Subjects.length; z++)
    {
        subjStr += "<option value='" + manageReportData.Subjects[z].SubjectID + "'>" + manageReportData.Subjects[z].SubjectName + "</option>";
    }
    subjStr += "</select>";

    additionalSubj += "<tr><td colspan='3'><h3>Add:</h3></td></tr>";
    additionalSubj += "<tr><td>" + subjStr + "</td><td><input id='inpMark_" + month + "_" + year + "' class='numericInput' maxvalue='100' type='text' style='width:50px;' /></td><td><a href='#' OnClick='return AddSubject(" + month + ", " + year + ");'><img src='Images/Toolbar/Add.png' style='height:15px;width:15px;' /></a></td></tr></table>";

    return additionalSubj;
}

function ExistingSubjects(month, year)
{
    var dataStr = "<table class='conatiner' style='border-collapse:collapse; border-spacing: 0;width: 380px;'>";
    dataStr += "<tr><td style='border: solid 1px #cccccc;background-color:#ededed;padding:5px;width:290px;'><h3>Subject</h3></td><td style='border: solid 1px #cccccc;background-color:#ededed;padding:5px;text-align:center;'><h3>Mark</h3></td>";
    if (institutionBlocked != "True") {
        dataStr += "<td style='border: solid 1px #cccccc;background-color:#ededed;text-align:center;padding:5px;'></td>";
    }
    dataStr += "</tr>";

    if (hasExistingSubjects)
    {
        for (var x = 0; x < manageReportData.Data.length; x++)
        {
            if (manageReportData.Data[x].Month == month && manageReportData.Data[x].Year == year)
            {
                dataStr += "<tr id='" + manageReportData.Data[x].StudentReportID + "'><td style='border: solid 1px #cccccc;padding:5px;'><label>" + manageReportData.Data[x].SubjectName + "</label></td>";
                dataStr += "<td style='border: solid 1px #cccccc;text-align:right;padding:5px;'><label>" + manageReportData.Data[x].Mark + "</label></td>";
                if (institutionBlocked != "True") {
                    dataStr += "<td style='border: solid 1px #cccccc;padding:5px;text-align:center;'><a href='#' OnClick=\"return RemoveSubject(" + manageReportData.Data[x].StudentReportID + ", " + x + ", " + month + ", " + year + ", '" + manageReportData.Data[x].SubjectName + "', " + manageReportData.Data[x].StudentReportID + ")\" style='font-size:9px;'><img src='/Images/Delete2.png' title='Delete' style='width:10px;height:10px;' /></a></td></tr>";
                }
            }
        }
    }
    dataStr += "<tr><td colspan='3'><input id='hdnStudentID' type='hidden' value='" + manageReportData.Subjects[0].StudentID + "' /></td></tr></table>";

    return dataStr;
}

function RemoveSubject(StudentReportID, counter, month, year, subjectName, subjectID)
{
    var params = '{StudentReportID:' + StudentReportID + ' }';

    $.ajax({
        type: "POST",
        url: "Student_ApplicationDetails.aspx/RemoveStudentReportSubject",
        data: params,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function ()
        {
            // remove it from originalReportData.Data
            originalReportData.Data.splice(counter, 1);
            RefreshReport(month, year);
        }
    });
    return false;
}

function AddSubject(month, year, subjectName)
{
	var subj = $('#slcSubject_' + month + '_' + year).val();
	var mark = $('#inpMark_' + month + '_' + year).val();
	var studentID = $('#hdnStudentID').val();
	var subjectName = $('#slcSubject_' + month + '_' + year).find("option:selected").text();

	var params = '{StudentID:' + studentID + ', SubjectID:' + subj + ', Mark: ' + mark + ', Month: ' + month + ', Year: ' + year + '}';

	$.ajax({
	    type: "POST",
	    url: "Student_ApplicationDetails.aspx/AddStudentReportSubject",
	    data: params,
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    success: function (data) {
	        var studentReportID = data.d;

	        var obj =
	            {
	                StudentReportID: studentReportID,
	                SubjectID: subj,
	                Mark: mark,
	                SubjectName: subjectName,
	                Month: month,
	                StudentID: studentID,
                    Year: year
	            };
	        
	        originalReportData.Data[originalReportData.Data.length] = obj;
	        hasExistingSubjects = true;
	        RefreshReport(month, year);
	    }
	});
	return false;
}