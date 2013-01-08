<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title>USC FAO Parent Income & Expense Declaration Form</title>
    <link href="https://camel2.usc.edu/FaoForms/image/FaoForms.css" rel="stylesheet"
        type="text/css" />
    <link href="./css/mie.css" rel="stylesheet" type="text/css" />
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/smoothness/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/jquery-ui.min.js" type="text/javascript"></script>
    <script src="./js/autoNumeric-1.7.5.js" type="text/javascript"></script>
    <script src="./js/jquery.numeric.js" type="text/javascript"></script>
    <script src="./js/mie.js" type="text/javascript"></script>
</head>
<body>
    <input type="hidden" id="currentSystemYear" value="<%=DateTime.Today.Year%>" />
    <input type="hidden" id="currentSystemMonth" value="<%=DateTime.Today.Month%>" />
    <input type="hidden" id="txtCarTotalLYRAvg" class="auto" />
    <input type="hidden" id="txtCarTotalLYRAnn" class="auto" />
    <input type="hidden" id="txtCarTotalCYRAvg" class="auto" />
    <input type="hidden" id="txtCarTotalCYRAnn" class="auto" />
    <div id="bodyWrapper">
        <div id="bodyContent">
            <div id="uscHeader">
                <div id="uscbar">
                    <div id="MajorTitle">
                        $Academic Year$ FINANCIAL AID
                        <br />
                        Parent Income &amp; Expense Declaration Form
                    </div>
                    <div id="usclogo">
                        <a href="http://www.usc.edu/" target="_blank">
                            <img src="https://camel2.usc.edu/FaoForms/image/usc-shield-name.png" alt="USC" align="right" /></a></div>
                </div>
            </div>
            <!--id="uscHeader"-->
            <div id="navcontainer">
            </div>
            <!--id="navcontainer"-->
            <div id="mainBody">
                <div id="leftMenu">
                </div>
                <!--id="leftMenu"-->
                <div id="mainContentTwoCol">
                    <div class="mainContent">
                        <form method="post" id="mainform" runat="server">
                        <div>
                            <br />
                            <div>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <b>USC ID: $USC ID Number$</b>
                                        </td>
                                        <td align="right">
                                            <b>$Student Name$</b>
                                        </td>
                                    </tr>
                                </table>
                                <hr />
                            </div>
                        </div>
                        <div id="divValidIncomeContent">
                            <p>
                                <strong>Section 1: Parent Income</strong></p>
                            <ul>
                                <li>Please list ALL sources of income that are used to meet living expenses, including
                                    foreign income. </li>
                                <li>Please do not include any tax deferred income in your figures below.</li>
                                <li>Please report all figures as whole numbers rounded to the nearest dollar, excluding
                                    commas or decimals (example: 12,356.41 is reported as<strong> 12356</strong>). Negative
                                    values are not allowed.</li>
                            </ul>
                            <table border="1" width="100%" cellpadding="7">
                                <thead>
                                    <tr style="background-color: #FFCC00; text-align: center;">
                                        <td style="width: 5%;">
                                        </td>
                                        <td style="width: 55%">
                                            <strong>Source of Income (USD)</strong>
                                        </td>
                                        <td style="width: 10%">
                                            <strong>Monthly Average in
                                                <%=DateTime.Now.Year - 1 %>
                                            </strong>
                                        </td>
                                        <td style="width: 10%">
                                            <strong>Total in
                                                <%=DateTime.Now.Year - 1 %>
                                            </strong>
                                        </td>
                                        <td style="width: 10%">
                                            <strong>Monthly Average in
                                                <%=DateTime.Now.Year %>
                                            </strong>
                                        </td>
                                        <td style="width: 10%">
                                            <strong>Total in
                                                <%=DateTime.Now.Year %>
                                            </strong>
                                        </td>
                                    </tr>
                                </thead>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q1.
                                    </td>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td colspan="2">
                                                    Father’s gross wages/salary/tips
                                                    <br />
                                                    <span style="font-size: 11px;">(Excluding severance pay)</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    Total to date for
                                                    <%=DateTime.Now.Year %>:
                                                </td>
                                                <td style="width: 10%">
                                                    <input id="txtFatherToDate" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    Estimate for remainder of
                                                    <%=DateTime.Now.Year %>:
                                                </td>
                                                <td>
                                                    <input id="txtFatherEstimate" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFatherLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFatherLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFatherCYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFatherCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q2.
                                    </td>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td colspan="2">
                                                    Mother’s gross wages/salary/tips
                                                    <br />
                                                    <span style="font-size: 11px;">(Excluding severance pay)</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    Total to date for
                                                    <%=DateTime.Now.Year %>:
                                                </td>
                                                <td style="width: 10%">
                                                    <input id="txtMotherToDate" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    Estimate for remainder of
                                                    <%=DateTime.Now.Year %>:
                                                </td>
                                                <td>
                                                    <input id="txtMotherEstimate" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtMotherLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtMotherLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtMotherCYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtMotherCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="border-bottom-color: #C0C0C0; font-weight: bold; text-align: center;">
                                        Q3.
                                    </td>
                                    <td style="border-bottom-color: #C0C0C0;">
                                        Gross income from business or farm
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtGrossBusinessLYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtGrossBusinessLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtGrossBusinessCYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtGrossBusinessCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="border-bottom-color: #C0C0C0; font-weight: bold; text-align: center;">
                                        Q4.
                                    </td>
                                    <td style="border-bottom-color: #C0C0C0">
                                        Expenses from business or farm
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtExpensesBusinessLYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtExpensesBusinessLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtExpensesBusinessCYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtExpensesBusinessCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="total">
                                    <td style="font-weight: bold; text-align: center;">
                                    </td>
                                    <td>
                                        Net income from business or farm
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtNetBusinessLYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtNetBusinessLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtNetBusinessCYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td>
                                        <input id="txtNetBusinessCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="border-bottom-color: #C0C0C0; font-weight: bold; text-align: center;">
                                        Q5.
                                    </td>
                                    <td style="border-bottom-color: #C0C0C0;">
                                        Gross income from rental, partnerships, royalties, trust, or corporations
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtGrossRentalLYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtGrossRentalLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtGrossRentalCYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtGrossRentalCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="border-bottom-color: #C0C0C0; font-weight: bold; text-align: center;">
                                        Q6.
                                    </td>
                                    <td style="border-bottom-color: #C0C0C0">
                                        Expenses from rental, partnerships, royalties, trust, or corporations
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtExpensesRentalLYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtExpensesRentalLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtExpensesRentalCYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center; border-bottom-color: #C0C0C0;">
                                        <input id="txtExpensesRentalCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="total">
                                    <td style="font-weight: bold; text-align: center;">
                                    </td>
                                    <td>
                                        Net income from rental, partnerships, royalties, trust, or corporations
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtNetRentalLYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtNetRentalLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtNetRentalCYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td>
                                        <input id="txtNetRentalCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q7.
                                    </td>
                                    <td>
                                        Interest/dividends
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtInterestLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtInterestLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtInterestCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtInterestCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q8.
                                    </td>
                                    <td>
                                        Capital gains
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCapitalLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCapitalLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCapitalCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCapitalCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q9.
                                    </td>
                                    <td>
                                        Social Security
                                        <br />
                                        <span style="font-size: 11px;">(Include benefits for dependent children as well as yourself.)</span>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtSocialLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtSocialLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtSocialCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtSocialCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q10.
                                    </td>
                                    <td>
                                        Pensions/annuities
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPensionLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPensionLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPensionCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPensionCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q11.
                                    </td>
                                    <td>
                                        Alimony/spousal support
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtAlimonyLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtAlimonyLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtAlimonyCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtAlimonyCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q12.
                                    </td>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    Monthly unemployment benefits
                                                </td>
                                                <td style="text-align: right">
                                                    <input id="txtUnemploymentTotal" maxlength="7" size="7" type="text" class="auto"
                                                        onchange="$(this).updateIncomeFields();" />
                                                </td>
                                            </tr>
                                        </table>
                                        <div id="divUnemploymentDates" style="display: none">
                                            <table style="text-align: right" align="right">
                                                <tr>
                                                    <td>
                                                        <label style="color: Red; font-weight: bold">
                                                            *</label>Benefits start:
                                                    </td>
                                                    <td>
                                                        <select name="selUnemploymentBeginMonth" id="selUnemploymentBeginMonth" onchange="$(this).updateIncomeFields();"
                                                            size="1">
                                                            <option value="0"></option>
                                                            <option value="1">January</option>
                                                            <option value="2">February</option>
                                                            <option value="3">March</option>
                                                            <option value="4">April</option>
                                                            <option value="5">May</option>
                                                            <option value="6">June</option>
                                                            <option value="7">July</option>
                                                            <option value="8">August</option>
                                                            <option value="9">September</option>
                                                            <option value="10">October</option>
                                                            <option value="11">November</option>
                                                            <option value="12">December</option>
                                                        </select>
                                                        <select name="selUnemploymentBeginYear" id="selUnemploymentBeginYear" onchange="$(this).updateIncomeFields();"
                                                            size="1">
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label style="color: Red; font-weight: bold">
                                                            *</label>Benefits end:
                                                    </td>
                                                    <td>
                                                        <select name="selUnemploymentExpiryMonth" id="selUnemploymentExpiryMonth" onchange="$(this).updateIncomeFields();"
                                                            size="1">
                                                            <option value="0"></option>
                                                            <option value="1">January</option>
                                                            <option value="2">February</option>
                                                            <option value="3">March</option>
                                                            <option value="4">April</option>
                                                            <option value="5">May</option>
                                                            <option value="6">June</option>
                                                            <option value="7">July</option>
                                                            <option value="8">August</option>
                                                            <option value="9">September</option>
                                                            <option value="10">October</option>
                                                            <option value="11">November</option>
                                                            <option value="12">December</option>
                                                        </select>
                                                        <select name="selUnemploymentExpiryYear" id="selUnemploymentExpiryYear" onchange="$(this).updateIncomeFields();"
                                                            size="1">
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: center; background-color: Gray">
                                        <input id="txtUnemploymentLYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" style="background-color: Gray;
                                            color: Gray" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtUnemploymentLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center; background-color: Gray">
                                        <input id="txtUnemploymentCYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" style="background-color: Gray;
                                            color: Gray" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtUnemploymentCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q13.
                                    </td>
                                    <td>
                                        Severance pay
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPayLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPayLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPayCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPayCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q14.
                                    </td>
                                    <td>
                                        Workers’ compensation/disability benefits
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCompensationLYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCompensationLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCompensationCYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCompensationCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q15.
                                    </td>
                                    <td>
                                        Temporary Assistance for Needy Families (TANF)
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFamiliesLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFamiliesLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFamiliesCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFamiliesCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q16.
                                    </td>
                                    <td>
                                        Child support received for all children
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildrenLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildrenLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildrenCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildrenCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q17.
                                    </td>
                                    <td>
                                        Veterans’ non-educational benefits
                                        <div id="divVeteransSourceLYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year - 1%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyVeteransSourceLYR">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtVeteransSourceLYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveVeteransSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removeveteranssourcelyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddVeteransSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="addbutton addveteranssourcelyr" title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                        <div id="divVeteransSourceCYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyVeteransSourceCYR">
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <input id="txtVeteransSourceCYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveVeteransSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removeveteranssourcecyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddVeteransSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="addbutton addveteranssourcecyr" title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtVeteransLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtVeteransLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtVeteransCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtVeteransCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q18.
                                    </td>
                                    <td>
                                        Cash support or money paid on your behalf
                                        <div id="divCashSourceLYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 30%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 65%" colspan="2">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Name / Relationship (<%=DateTime.Now.Year - 1%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyCashSourceLYR">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtCashSourceNameLYR" type="text" size="18" maxlength="18" />
                                                        </td>
                                                        <td>
                                                            <input id="txtCashSourceRelationshipLYR" type="text" size="12" maxlength="12" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveCashSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removecashsourcelyr" disabled="disabled" title="Click here to remove this person" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddCashSourceLYR" style="width: 16px; height: 16px; left: 1px;" class="addbutton addcashsourcelyr"
                                                                title="Click here to add an additional person" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                        <div id="divCashSourceCYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 30%">
                                                        </td>
                                                        <td style="text-align: center; width: 65%" colspan="2">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Name / Relationship (<%=DateTime.Now.Year%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyCashSourceCYR">
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <input id="txtCashSourceNameCYR" type="text" size="18" maxlength="18" />
                                                        </td>
                                                        <td>
                                                            <input id="txtCashSourceRelationshipCYR" type="text" size="12" maxlength="12" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveCashSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removecashsourcecyr" disabled="disabled" title="Click here to remove this person" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddCashSourceCYR" style="width: 16px; height: 16px; left: 1px;" class="addbutton addcashsourcecyr"
                                                                title="Click here to add an additional person" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCashLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCashLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCashCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtCashCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q19.
                                    </td>
                                    <td>
                                        Housing, food and other living allowances from your employer<br />
                                        <span style="font-size: 11px;">(Include cash payments and value of benefits)</span>
                                        <div id="divHousingSource" style="display: none">
                                            <table style="text-align: right" align="right">
                                                <tr>
                                                    <td>
                                                        <label style="text-align: right;">
                                                            Source:</label>
                                                    </td>
                                                    <td>
                                                        <input type="radio" id="radHousingClergy" name="radHousing" value="clergy" checked="checked"
                                                            onclick="$(this).changeHousingOptions(this.value);" />Clergy&nbsp;<input type="radio"
                                                                name="radHousing" id="radHousingMilitary" value="military" onclick="$(this).changeHousingOptions(this.value);" />Military&nbsp;<input
                                                                    type="radio" name="radHousing" id="radHousingOther" value="other" onclick="$(this).changeHousingOptions(this.value);" />Other&nbsp;
                                                    </td>
                                                </tr>
                                                <tr id="trHousingOther" style="display: none">
                                                    <td>
                                                        <label style="color: Red; font-weight: bold; text-align: right;">
                                                            *</label>Explain:
                                                    </td>
                                                    <td>
                                                        <input id="txtHousingOther" maxlength="25" size="25" type="text" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: center">
                                        <div id="divHousingBAH1" style="display: none">
                                            BAH:</div>
                                        <input id="txtHousingLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                        <div id="divHousingBAS1" style="display: none">
                                            BAS:<br />
                                            <input id="txtHousingLYRAvg2" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" /></div>
                                    </td>
                                    <td style="text-align: center;">
                                        <div id="divHousingBAH2" style="display: none">
                                            BAH:</div>
                                        <input id="txtHousingLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                        <div id="divHousingBAS2" style="display: none">
                                            BAS:<br />
                                            <input id="txtHousingLYRAnn2" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                                readonly="readonly" tabindex="-1" onfocus="this.blur();" /></div>
                                    </td>
                                    <td style="text-align: center">
                                        <div id="divHousingBAH3" style="display: none">
                                            BAH:</div>
                                        <input id="txtHousingCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                        <br />
                                        <div id="divHousingBAS3" style="display: none">
                                            BAS:<input id="txtHousingCYRAvg2" maxlength="7" size="7" type="text" class="auto"
                                                onchange="$(this).updateIncomeFields();" /></div>
                                    </td>
                                    <td style="text-align: center;">
                                        <div id="divHousingBAH4" style="display: none">
                                            BAH:</div>
                                        <input id="txtHousingCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                        <div id="divHousingBAS4" style="display: none">
                                            BAS:<input id="txtHousingCYRAnn2" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                                readonly="readonly" tabindex="-1" onfocus="this.blur();" /></div>
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q20.
                                    </td>
                                    <td>
                                        Payments made to tax deferred pension and saving plans [Example: 401(k), 403(b)]
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtTaxLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtTaxLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtTaxCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtTaxCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q21.
                                    </td>
                                    <td>
                                        Personal loans
                                        <div id="divLoansSourceLYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year - 1%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyLoansSourceLYR">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtLoansSourceLYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveLoansSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removeloanssourcelyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddLoansSourceLYR" style="width: 16px; height: 16px; left: 1px;" class="addbutton addloanssourcelyr"
                                                                title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                        <div id="divLoansSourceCYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyLoansSourceCYR">
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <input id="txtLoansSourceCYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveLoansSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removeloanssourcecyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddLoansSourceCYR" style="width: 16px; height: 16px; left: 1px;" class="addbutton addloanssourcecyr"
                                                                title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtLoansLYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtLoansLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtLoansCYRAvg" maxlength="7" size="7" type="text" class="auto" onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtLoansCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q22.
                                    </td>
                                    <td>
                                        Credit card advances
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeCreditLYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeCreditLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeCreditCYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeCreditCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q23.
                                    </td>
                                    <td>
                                        Other
                                        <div id="divIncomeOtherSourceLYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year - 1%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyIncomeOtherSourceLYR">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtIncomeOtherSourceLYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveIncomeOtherSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removeincomeothersourcelyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddIncomeOtherSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="addbutton addincomeothersourcelyr" title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                        <div id="divIncomeOtherSourceCYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyIncomeOtherSourceCYR">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtIncomeOtherSourceCYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveIncomeOtherSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removeincomeothersourcecyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddIncomeOtherSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="addbutton addincomeothersourcecyr" title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeOtherLYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeOtherLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeOtherCYRAvg" maxlength="7" size="7" type="text" class="auto"
                                            onchange="$(this).updateIncomeFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeOtherCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="total">
                                    <td style="font-weight: bold; text-align: center;">
                                    </td>
                                    <td align="center">
                                        <strong>TOTAL INCOME</strong>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeTotalLYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeTotalLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeTotalCYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtIncomeTotalCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                            </table>
                            <hr class="hrTab" />
                            <div align="right">
                                <input type="button" name="btnNext" value="Next Page" id="btnNext" />
                                <br />
                                <br />
                                <br />
                            </div>
                        </div>
                        <div id="divValidExpensesContent" style="text-align: left;">
                            <p>
                                <strong>Section 2: Parent Expenses</strong></p>
                            <ul>
                                <li>Next to each item, fill in the dollar amount of your family’s average monthly living
                                    expenses. If your family shares living expenses with others, indicate only that
                                    portion of expenses which your family pays. If an expense occurs other than monthly,
                                    please convert it to a monthly average.</li>
                                <li>Please report all figures as whole numbers rounded to the nearest dollar, excluding
                                    commas or decimals (example: 12,356.41 is reported as<strong> 12356</strong>).</li>
                                <li>Report only your family’s living expenses.<br />
                                    <span class="errmsg">DO NOT REPORT ANY BUSINESS OR RENTAL PROPERTY EXPENSES.</span></li>
                            </ul>
                            <table border="1" width="100%" cellpadding="7">
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center; width: 5%">
                                        Q24.
                                    </td>
                                    <td style="width: 95%">
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 70%">
                                                    <label style="color: Red; font-weight: bold;">
                                                        *</label>Does the family share living expenses with others?
                                                </td>
                                                <td style="width: 30%">
                                                    <input type="radio" id="radShareLivingYes" name="radShareLiving" value="radShareLivingYes"
                                                        onclick="$('#divShareLiving').fadeIn();" />Yes
                                                    <input type="radio" id="radShareLivingNo" name="radShareLiving" value="radShareLivingNo"
                                                        onclick="$('#divShareLiving').fadeOut();" />No
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div id="divShareLiving" style="display: none; margin-left: 20px;">
                                                        <label style="color: Red; font-weight: bold">
                                                            *</label>What is the total monthly contribution from others?&nbsp; USD
                                                        <input id="txtTotalMonthlyContribution" maxlength="7" size="7" class="auto" type="text" />
                                                        <br />
                                                        <label style="color: Red; font-weight: bold">
                                                            *</label>Please indicate the name and relationship of those with whom you share
                                                        living expenses.
                                                        <br />
                                                        <table id="tabShareLiving" style="margin: 5px 5px 5px 0px;">
                                                            <thead>
                                                                <tr>
                                                                    <th align="center">
                                                                        Name
                                                                    </th>
                                                                    <th align="center">
                                                                        Relationship
                                                                    </th>
                                                                    <th>
                                                                        &nbsp;
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="tbodyShareLiving">
                                                                <tr>
                                                                    <td>
                                                                        <input id="txtShareLivingName" type="text" size="25" maxlength="25" />
                                                                    </td>
                                                                    <td>
                                                                        <input id="txtShareLivingRelationship" type="text" size="20" maxlength="20" />
                                                                    </td>
                                                                    <td>
                                                                        <button id="btnRemove" style="width: 16px; height: 16px; left: 1px;" class="removebutton removeperson"
                                                                            disabled="disabled" title="Click here to remove this person" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <td colspan="3">
                                                                        <button id="btnAddNewPerson" style="width: 16px; height: 16px; left: 1px;" class="addbutton addperson"
                                                                            title="Click here to add an additional person" />
                                                                    </td>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q25.
                                    </td>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 70%">
                                                    <label style="color: Red; font-weight: bold;">
                                                        *</label>Does the family pay rent?
                                                </td>
                                                <td style="width: 30%">
                                                    <input type="radio" id="radPayRentYes" name="radPayRent" value="radPayRentYes" onclick="$(this).changeMortgageSection();" />Yes
                                                    <input type="radio" id="radPayRentNo" name="radPayRent" value="radPayRentNo" onclick="$(this).changeMortgageSection();" />No
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q26.
                                    </td>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 70%">
                                                    <label style="color: Red; font-weight: bold;">
                                                        *</label>Does the family pay a mortgage?
                                                </td>
                                                <td style="width: 30%">
                                                    <input type="radio" id="radPayMortgageYes" name="radPayMortgage" value="radPayMortgageYes"
                                                        onclick="$(this).changeMortgageSection();" />Yes
                                                    <input type="radio" id="radPayMortgageNo" name="radPayMortgage" value="radPayMortgageNo"
                                                        onclick="$(this).changeMortgageSection();" />No
                                                </td>
                                            </tr>
                                            <tr id="trPayMortgage" style="display: none;">
                                                <td>
                                                    <label style="margin-left: 20px; color: Red; font-weight: bold;">
                                                        *</label><label>Are payments current?</label>
                                                </td>
                                                <td>
                                                    <input type="radio" id="radPayMortgageCurrentYes" name="radPayMortgageCurrent" value="radPayMortgageCurrentYes"
                                                        onclick="$(this).changePayMortgageCurrentSection();" />Yes
                                                    <input type="radio" id="radPayMortgageCurrentNo" name="radPayMortgageCurrent" value="radPayMortgageCurrentNo"
                                                        onclick="$(this).changePayMortgageCurrentSection();" />No
                                                </td>
                                            </tr>
                                            <tr id="trPayMortgageCurrent" style="display: none;">
                                                <td colspan="2">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <label style="color: Red; font-weight: bold; margin-left: 20px;">
                                                                    *</label>Please explain why payments are not current.
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <textarea id="txtPaymentsNotCurrent" style="margin-left: 20px;" cols="77" rows="3"
                                                                    onkeyup="$(this).textCounter(this,this.form.counterPaymentsNotCurrent,255);"></textarea>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <input name="counterPaymentsNotCurrent" maxlength="3" size="3" value="255" readonly="readonly"
                                                                    tabindex="-1" style="border-style: hidden; text-align: right;" class="rowodd" />
                                                                characters remaining
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <div id="divNeitherRentOrMortgage" style="display: none;">
                                <br />
                                <table class="rowodd" width="100%" cellpadding="8px" border="1">
                                    <tr>
                                        <td style="border-bottom-color: #DDDDDD;">
                                            <label style="color: Red; font-weight: bold;">
                                                *</label><label>Please explain why your family does not pay rent or mortgage.</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-bottom-color: #DDDDDD;">
                                            <textarea id="txtNeitherRentOrMortgage" cols="87" rows="3" onkeyup="$(this).textCounter(this,this.form.counterNeitherRentOrMortgage,255);"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <input name="counterNeitherRentOrMortgage" maxlength="3" size="3" value="255" readonly="readonly"
                                                tabindex="-1" style="border-style: hidden; text-align: right;" class="rowodd" />
                                            characters remaining
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <table border="1" width="100%" cellpadding="7">
                                <thead>
                                    <tr style="background-color: #FFCC00; text-align: center">
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 55%">
                                            <strong>Monthly Expenses (USD)</strong>
                                        </td>
                                        <td style="width: 10%">
                                            <strong>Monthly Average in
                                                <%=DateTime.Now.Year - 1 %></strong>
                                        </td>
                                        <td style="width: 10%">
                                            <strong>Total in
                                                <%=DateTime.Now.Year - 1 %></strong>
                                        </td>
                                        <td style="width: 10%">
                                            <strong>Monthly Average in
                                                <%=DateTime.Now.Year %></strong>
                                        </td>
                                        <td style="width: 10%">
                                            <strong>Total in
                                                <%=DateTime.Now.Year %></strong>
                                        </td>
                                    </tr>
                                </thead>
                                <tr class="roweven">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q27.
                                    </td>
                                    <td>
                                        Child support paid<br />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildSupportLYRAvg" maxlength="7" size="7" class="auto" type="text"
                                            onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildSupportLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildSupportCYRAvg" maxlength="7" size="7" class="auto" type="text"
                                            onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildSupportCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q28.
                                    </td>
                                    <td>
                                        Home mortgage/rent
                                        <br />
                                        <span style="font-size: 11px;">(Do not include insurance, property tax, or mortgage
                                            on rental properties.)</span>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtHomeLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtHomeLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtHomeCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtHomeCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold">
                                        Q29.
                                    </td>
                                    <td>
                                        Property tax on primary residence only
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPropertyTaxLYRAvg" maxlength="7" size="7" class="auto" type="text"
                                            onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPropertyTaxLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPropertyTaxCYRAvg" maxlength="7" size="7" class="auto" type="text"
                                            onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPropertyTaxCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold; text-align: center;">
                                        Q30.
                                    </td>
                                    <td>
                                        Food and household supplies
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFoodLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFoodLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFoodCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtFoodCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold">
                                        Q31.
                                    </td>
                                    <td>
                                        Utilities
                                        <br />
                                        <span style="font-size: 11px;">(Gas, electric, water, etc.)</span>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtUtilitiesLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtUtilitiesLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtUtilitiesCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtUtilitiesCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold">
                                        Q32.
                                    </td>
                                    <td>
                                        Phone, cable, Internet
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPhoneLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPhoneLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPhoneCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPhoneCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold">
                                        Q33.
                                    </td>
                                    <td>
                                        Clothing
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtClothingLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtClothingLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtClothingCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtClothingCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold">
                                        Q34.
                                    </td>
                                    <td>
                                        Child care
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildCareLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildCareLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildCareCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtChildCareCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold">
                                        Q35.
                                    </td>
                                    <td>
                                        Private, elementary/secondary school tuition
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPrivateLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPrivateLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPrivateCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPrivateCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold">
                                        Q36.
                                    </td>
                                    <td>
                                        Insurance
                                        <br />
                                        <span style="font-size: 11px;">(Home, car, health, life, etc.)</span>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtInsuranceLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtInsuranceLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtInsuranceCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtInsuranceCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold">
                                        Q37.
                                    </td>
                                    <td>
                                        Medical/health expenses paid out of pocket and NOT covered by insurance
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtMedicalLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtMedicalLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtMedicalCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtMedicalCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold">
                                        Q38.
                                    </td>
                                    <td>
                                        Gasoline and auto maintenance or public transportation
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtGasolineLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtGasolineLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtGasolineCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtGasolineCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold">
                                        Q39.
                                    </td>
                                    <td>
                                        <label>
                                            Car payments</label>
                                        <div id="divCarPayments" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 45%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 35%">
                                                            Make
                                                        </td>
                                                        <td style="text-align: center; width: 15%">
                                                            Year
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyCar">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtCarBrand" type="text" size="20" maxlength="20" />
                                                        </td>
                                                        <td>
                                                            <input id="txtCarYear" type="text" size="4" maxlength="4" class="positive" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveCar" style="width: 16px; height: 16px; left: 1px;" class="removebutton removecar"
                                                                disabled="disabled" title="Click here to remove this car payment" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="3">
                                                            <button id="btnAddCar" style="width: 16px; height: 16px; left: 1px;" class="addbutton addcar"
                                                                title="Click here to add an additional car payment" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: center">
                                        <label id="lblCar1" style="display: none">
                                            &nbsp;</label>
                                        <table>
                                            <thead id="theadCar1" style="display: none">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody id="tbodyCar1">
                                                <tr>
                                                    <td>
                                                        <input id="txtCarLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateCarFields();" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot id="tfootCar1" style="display: none">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </td>
                                    <td style="text-align: center">
                                        <label id="lblCar2" style="display: none">
                                            &nbsp;</label>
                                        <table>
                                            <thead id="theadCar2" style="display: none">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody id="tbodyCar2">
                                                <tr>
                                                    <td>
                                                        <input id="txtCarLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot id="tfootCar2" style="display: none">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </td>
                                    <td style="text-align: center">
                                        <label id="lblCar3" style="display: none">
                                            &nbsp;</label>
                                        <table>
                                            <thead id="theadCar3" style="display: none">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody id="tbodyCar3">
                                                <tr>
                                                    <td>
                                                        <input id="txtCarCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateCarFields();" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot id="tfootCar3" style="display: none">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </td>
                                    <td style="text-align: center">
                                        <label id="lblCar4" style="display: none">
                                            &nbsp;</label>
                                        <table>
                                            <thead id="theadCar4" style="display: none">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody id="tbodyCar4">
                                                <tr>
                                                    <td>
                                                        <input id="txtCarCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot id="tfootCar4" style="display: none">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold">
                                        Q40.
                                    </td>
                                    <td>
                                        Credit card advances
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesCreditLYRAvg" maxlength="7" size="7" class="auto" type="text"
                                            onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesCreditLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesCreditCYRAvg" maxlength="7" size="7" class="auto" type="text"
                                            onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesCreditCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="roweven">
                                    <td style="font-weight: bold">
                                        Q41.
                                    </td>
                                    <td>
                                        Personal loan payments
                                        <div id="divPersonalSourceLYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year - 1%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyPersonalSourceLYR">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtPersonalSourceLYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemovePersonalSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removepersonalsourcelyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddPersonalSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="addbutton addpersonalsourcelyr" title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                        <div id="divPersonalSourceCYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyPersonalSourceCYR">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtPersonalSourceCYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemovePersonalSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removepersonalsourcecyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddPersonalSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="addbutton addpersonalsourcecyr" title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPersonalLYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPersonalLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPersonalCYRAvg" maxlength="7" size="7" class="auto" type="text" onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtPersonalCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign roweven"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="rowodd">
                                    <td style="font-weight: bold">
                                        Q42.
                                    </td>
                                    <td>
                                        Other
                                        <div id="divExpensesOtherExplainLYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year - 1%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyExpensesOtherSourceLYR">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtExpensesOtherExplainLYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveExpensesOtherSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removeexpensesothersourcelyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddExpensesOtherSourceLYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="addbutton addexpensesothersourcelyr" title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                        <div id="divExpensesOtherExplainCYR" style="display: none">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <td style="text-align: left; width: 50%">
                                                            &nbsp;
                                                        </td>
                                                        <td style="text-align: center; width: 45%">
                                                            <label style="color: Red; font-weight: bold">
                                                                *</label>Source (<%=DateTime.Now.Year%>):
                                                        </td>
                                                        <td style="text-align: center; width: 5%">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyExpensesOtherSourceCYR">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <input id="txtExpensesOtherExplainCYR" type="text" size="25" maxlength="25" />
                                                        </td>
                                                        <td>
                                                            <button id="btnRemoveExpensesOtherSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="removebutton removeexpensesothersourcecyr" disabled="disabled" title="Click here to remove this source" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            <button id="btnAddExpensesOtherSourceCYR" style="width: 16px; height: 16px; left: 1px;"
                                                                class="addbutton addexpensesothersourcecyr" title="Click here to add an additional source" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesOtherLYRAvg" maxlength="7" size="7" class="auto" type="text"
                                            onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesOtherLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesOtherCYRAvg" maxlength="7" size="7" class="auto" type="text"
                                            onchange="$(this).updateExpensesFields();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesOtherCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign rowodd"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                                <tr class="total">
                                    <td style="font-weight: bold">
                                    </td>
                                    <td align="center">
                                        <strong>TOTAL EXPENSES</strong>
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesTotalLYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesTotalLYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesTotalCYRAvg" maxlength="7" size="7" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="txtExpensesTotalCYRAnn" maxlength="9" size="9" type="text" class="auto dollarsign total"
                                            readonly="readonly" tabindex="-1" onfocus="this.blur();" />
                                    </td>
                                </tr>
                            </table>
                            <div>
                                <br />
                                <div id="divRemainingExpenses">
                                    <table class="rowodd" width="100%" cellpadding="8px" border="1">
                                        <tr>
                                            <td style="border-bottom-color: #DDDDDD;">
                                                <label style="color: Red; font-weight: bold;">
                                                    *</label><label style="font-weight: bold;">Your monthly income is less than your expenses.</label><br />
                                                Please explain how you meet your remaining expenses.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-bottom-color: #DDDDDD;">
                                                <textarea id="txtRemainingExpensesExplain" cols="87" rows="3" onkeyup="$(this).textCounter(this,this.form.counterRemainingExpenses,255);"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <input name="counterRemainingExpenses" maxlength="3" size="3" value="255" readonly="readonly"
                                                    tabindex="-1" style="border-style: hidden; text-align: right;" class="rowodd" />
                                                characters remaining
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <p style="text-align: left">
                                    <strong>Certification:</strong> I/we affirm that all the information on this form
                                    is true and correct to the best of my/our knowledge. I/we understand that USC may
                                    verify all estimates of income at year end. Adjustments may be made to current or
                                    future financial aid if inaccurate estimates of income result in a financial aid
                                    over-award.
                                </p>
                                <p style="text-align: right">
                                    <input type="checkbox" id="chkConfirmation" name="chkConfirmation" />
                                    <strong>I have read and agree with the above statement.</strong></p>
                            </div>
                            <hr class="hrTab" />
                            <div>
                                <table width="100%">
                                    <tr>
                                        <td align="left">
                                            <input type="button" name="btnPrev" value="Prev Page" id="btnPrev" />
                                        </td>
                                        <td align="right">
                                            <asp:Button ID="btnSubmit" Text="Submit" UseSubmitBehavior="true" disabled="disabled"
                                                runat="server" OnClick="btnSubmit_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <br />
                            </div>
                        </div>
                        </form>
                    </div>
                    <!-- class="mainContent"-->
                    <div id="mainContentBottom" align="right">
                        <a href="http://www.usc.edu/contactfao" target="_blank">CONTACT US</a>
                    </div>
                    <!--id="mainContentBottom"-->
                    <div class="btm">
                    </div>
                </div>
                <!--id="mainContentTwoCol"-->
            </div>
            <!--id="mainBody"-->
        </div>
        <!--id="bodyContent"-->
        <div id="FooterWrapper">
            <div id="FooterContent">
            </div>
            <!--id="FooterContent"-->
        </div>
        <!--id="FooterWrapper"-->
    </div>
    <!--id="bodyWrapper"-->
</body>
</html>
