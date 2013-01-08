/**
*
* mie.js
* @author: Sangik Park
* @version: 1.1
* 
* Copyright (c) 2012 University of Southern California
*
*/

// Constants for alert resource string
var ALERT_STRING_SOURCE = 'You cannot add more than 10 sources.';
var ALERT_STRING_PERSON = 'You cannot add more than 10 persons.';
var ALERT_STRING_CARPAYMENT = 'You cannot add more than 10 car payments.';
var ALERT_STRING_FILLOUT = 'Please fill out all fields.';
var ALERT_STRING_BENEFIT = 'The benefits end date should be greater than or equal to the start date.';

// Constants for button resource string
var HTML_VETERANS_SOURCE_LYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removeveteranssourcelyr">Click here to remove this source</button>';
var HTML_VETERANS_SOURCE_CYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removeveteranssourcecyr">Click here to remove this source</button>';
var HTML_CASH_SOURCE_LYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removecashsourcelyr">Click here to remove this person</button>';
var HTML_CASH_SOURCE_CYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removecashsourcecyr">Click here to remove this person</button>';
var HTML_LOANS_SOURCE_LYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removeloanssourcelyr">Click here to remove this source</button>';
var HTML_LOANS_SOURCE_CYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removeloanssourcecyr">Click here to remove this source</button>';
var HTML_INCOME_OTHER_SOURCE_LYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removeincomeothersourcelyr">Click here to remove this source</button>';
var HTML_INCOME_OTHER_SOURCE_CYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removeincomeothersourcecyr">Click here to remove this source</button>';
var HTML_EXPENSES_PERSONAL_SOURCE_LYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removepersonalsourcelyr">Click here to remove this source</button>';
var HTML_EXPENSES_PERSONAL_SOURCE_CYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removepersonalsourcecyr">Click here to remove this source</button>';
var HTML_EXPENSES_OTHER_SOURCE_LYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removeexpensesothersourcelyr">Click here to remove this source</button>';
var HTML_EXPENSES_OTHER_SOURCE_CYR_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removeexpensesothersourcecyr">Click here to remove this source</button>';
var HTML_PERSON_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removeperson">Click here to remove this person</button>';
var HTML_CARPAYMENT_REMOVE_BUTTON = '<button style="width:16px; height:16px; left:1px;" class="removecar">Click here to remove this car payment</button>';

$(function () {
    $('#divValidIncomeContent').show();
    $('#divValidExpensesContent').hide();

    // Not support decimal by adding aPad: false
    $('input').filter('.dollarsign').autoNumeric({ vMax: '999999999', vMin: '0', aPad: false, aSign: '$' });
    $('input').filter('.auto').autoNumeric({ vMax: '999999', vMin: '0', aPad: false });

    $('input').filter('.auto').focus(function () {
        $(this).select();
    });

    var currentYear = parseInt($('#currentSystemYear').val());

    var options = $('#selUnemploymentBeginYear').prop('options');

    options[options.length] = new Option('', 0);
    options[options.length] = new Option(currentYear - 2, currentYear - 2);
    options[options.length] = new Option(currentYear - 1, currentYear - 1);
    options[options.length] = new Option(currentYear, currentYear);

    options = $('#selUnemploymentExpiryYear').prop('options');
    options[options.length] = new Option('', 0);
    options[options.length] = new Option(currentYear - 1, currentYear - 1);
    options[options.length] = new Option(currentYear, currentYear);
    options[options.length] = new Option(currentYear + 1, currentYear + 1);
    options[options.length] = new Option(currentYear + 2, currentYear + 2);

    // Refer to jquery.numeric.js
    $('.positive').numeric();
    $('.positive').numeric({ negative: false }, function () { this.value = ''; this.focus(); });

    $('button').filter('.addbutton').button({
        icons: {
            primary: "ui-icon-plus"
        },
        text: false
    });

    $('button').filter('.removebutton').button({
        icons: {
            primary: "ui-icon-close"
        },
        text: false
    });

    /**
    * Add/remove veterans' sources for LYR
    */
    $('button.addveteranssourcelyr').click(function () {
        var allCells = $('#tbodyVeteransSourceLYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyVeteransSourceLYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_VETERANS_SOURCE_LYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removeveteranssourcelyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removeveteranssourcelyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove veterans' sources for CYR
    */
    $('button.addveteranssourcecyr').click(function () {
        var allCells = $('#tbodyVeteransSourceCYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyVeteransSourceCYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_VETERANS_SOURCE_CYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removeveteranssourcecyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removeveteranssourcecyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove cash sources for LYR
    */
    $('button.addcashsourcelyr').click(function () {
        var allCells = $('#tbodyCashSourceLYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyCashSourceLYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_CASH_SOURCE_LYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removecashsourcelyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removecashsourcelyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove cash sources for CYR
    */
    $('button.addcashsourcecyr').click(function () {
        var allCells = $('#tbodyCashSourceCYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyCashSourceCYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_CASH_SOURCE_CYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removecashsourcecyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removecashsourcecyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove loans' sources for LYR
    */
    $('button.addloanssourcelyr').click(function () {
        var allCells = $('#tbodyLoansSourceLYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyLoansSourceLYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_LOANS_SOURCE_LYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removeloanssourcelyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removeloanssourcelyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove loans' sources for CYR
    */
    $('button.addloanssourcecyr').click(function () {
        var allCells = $('#tbodyLoansSourceCYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyLoansSourceCYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_LOANS_SOURCE_CYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removeloanssourcecyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removeloanssourcecyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove income other sources for LYR
    */
    $('button.addincomeothersourcelyr').click(function () {
        var allCells = $('#tbodyIncomeOtherSourceLYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyIncomeOtherSourceLYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_INCOME_OTHER_SOURCE_LYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removeincomeothersourcelyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removeincomeothersourcelyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove income other sources for CYR
    */
    $('button.addincomeothersourcecyr').click(function () {
        var allCells = $('#tbodyIncomeOtherSourceCYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyIncomeOtherSourceCYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_INCOME_OTHER_SOURCE_CYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removeincomeothersourcecyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removeincomeothersourcecyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove persons who share living expenses
    */
    $('button.addperson').click(function () {
        var allCells = $('#tbodyShareLiving').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_PERSON);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyShareLiving');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_PERSON_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removeperson').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removeperson').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });
    
    /**
    * Add/remove car payments
    */
    $('button.addcar').click(function () {
        var allCells = $('#tbodyCar').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_CARPAYMENT);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyCar');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_CARPAYMENT_REMOVE_BUTTON);
        addRow.before(newRow);

        var addRow1 = $('tr:last-child', '#tbodyCar1');
        var newRow1 = addRow1.clone();
        $('input', addRow1).val('');
        addRow1.before(newRow1);

        var addRow2 = $('tr:last-child', '#tbodyCar2');
        var newRow2 = addRow2.clone();
        $('input', addRow2).val('');
        addRow2.before(newRow2);

        var addRow3 = $('tr:last-child', '#tbodyCar3');
        var newRow3 = addRow3.clone();
        $('input', addRow3).val('');
        addRow3.before(newRow3);

        var addRow4 = $('tr:last-child', '#tbodyCar4');
        var newRow4 = addRow4.clone();
        $('input', addRow4).val('');
        addRow4.before(newRow4);

        // Re-initialize fields in the table
        $('.positive', '#tbodyCar').numeric();
        $('input', '#tbodyCar1').filter('.auto').autoNumeric({ vMax: '999999', vMin: '0', aPad: false });
        $('input', '#tbodyCar2').filter('.dollarsign').autoNumeric({ vMax: '999999', vMin: '0', aPad: false, aSign: '$' });
        $('input', '#tbodyCar3').filter('.auto').autoNumeric({ vMax: '999999', vMin: '0', aPad: false });
        $('input', '#tbodyCar4').filter('.dollarsign').autoNumeric({ vMax: '999999', vMin: '0', aPad: false, aSign: '$' });

        $('button').filter('.removecar').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removecar').click(function () {
            var trIndex = $(this).parent().parent().getTrIndex();
            if (trIndex > 0) {
                $('tr', '#tbodyCar1').eq(trIndex).remove();
                $('tr', '#tbodyCar2').eq(trIndex).remove();
                $('tr', '#tbodyCar3').eq(trIndex).remove();
                $('tr', '#tbodyCar4').eq(trIndex).remove();
            }
            $(this).parent().parent().remove();
            $(this).updateCarFields();
            return false;
        });

        return false;
    });

    /**
    * Add/remove personal sources for LYR
    */
    $('button.addpersonalsourcelyr').click(function () {
        var allCells = $('#tbodyPersonalSourceLYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyPersonalSourceLYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_EXPENSES_PERSONAL_SOURCE_LYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removepersonalsourcelyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removepersonalsourcelyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove personal sources for CYR
    */
    $('button.addpersonalsourcecyr').click(function () {
        var allCells = $('#tbodyPersonalSourceCYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyPersonalSourceCYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_EXPENSES_PERSONAL_SOURCE_CYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removepersonalsourcecyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removepersonalsourcecyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove expenses other sources for LYR
    */
    $('button.addexpensesothersourcelyr').click(function () {
        var allCells = $('#tbodyExpensesOtherSourceLYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyExpensesOtherSourceLYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_EXPENSES_OTHER_SOURCE_LYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removeexpensesothersourcelyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removeexpensesothersourcelyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Add/remove expenses other sources for CYR
    */
    $('button.addexpensesothersourcecyr').click(function () {
        var allCells = $('#tbodyExpensesOtherSourceCYR').children();
        if (allCells.length >= 10) {
            alert(ALERT_STRING_SOURCE);
            return false;
        }

        var addRow = $('tr:last-child', '#tbodyExpensesOtherSourceCYR');
        var newRow = addRow.clone();
        $('input', addRow).val('');
        $('td:last-child', addRow).html(HTML_EXPENSES_OTHER_SOURCE_CYR_REMOVE_BUTTON);
        addRow.before(newRow);

        $('button').filter('.removeexpensesothersourcecyr').button({
            icons: {
                primary: "ui-icon-close"
            },
            text: false
        });

        $('button.removeexpensesothersourcecyr').click(function () {
            $(this).parent().parent().remove();
            return false;
        });

        return false;
    });

    /**
    * Get the index of TR element in TBODY element
    */
    $.fn.getTrIndex = function () {
        var tbody = this.parent();
        if (typeof (tbody) == 'undefined' || tbody == null || !tbody.is('tbody'))
            return -1;

        var allCells = tbody.children();
        var index = allCells.index(this);

        return index;
    };

    /**
    * Occurs when click next button
    */
    $('#btnNext').click(function () {
        if ($(this).validateIncomeFields() == true) {
            $('#divValidIncomeContent').fadeOut(1000);
            $('#divValidExpensesContent').fadeIn(1000);
            $(this).displayRemaingDiv();
            $("html, body").animate({ scrollTop: 0 }, 1000); // Scroll to top of page
        }
        else {
            alert(ALERT_STRING_FILLOUT);
        }
    });

    /**
    * Validates required fields in income page
    */
    $.fn.validateIncomeFields = function () {
        var result = true;

        // Validate all auto fields
        $('input[type!=hidden]').filter('.auto').each(function (index) {
            if ($(this).is(':visible') && $(this).val().length <= 0) {
                $(this).focus();
                result = false;
                return false; // break
            }
        });
        if (result == false)
            return false;

        if (parseInt($('#txtUnemploymentTotal').autoNumericGet()) > 0) {
            if ($('#selUnemploymentBeginMonth').val() == '0') {
                $('#selUnemploymentBeginMonth').focus();
                return false;
            }
            if ($('#selUnemploymentBeginYear').val() == '0') {
                $('#selUnemploymentBeginYear').focus();
                return false;
            }

            if ($('#selUnemploymentExpiryMonth').val() == '0') {
                $('#selUnemploymentExpiryMonth').focus();
                return false;
            }
            if ($('#selUnemploymentExpiryYear').val() == '0') {
                $('#selUnemploymentExpiryYear').focus();
                return false;
            }
        }

        if (parseInt($('#txtVeteransLYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyVeteransSourceLYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtVeteransCYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyVeteransSourceCYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtCashLYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyCashSourceLYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtCashCYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyCashSourceCYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if ((parseInt($('#txtHousingLYRAvg').autoNumericGet()) > 0 || parseInt($('#txtHousingCYRAvg').autoNumericGet()) > 0) && $('#radHousingOther').attr('checked') == "checked" && $.trim($("#txtHousingOther").val()).length <= 0) {
            $("#txtHousingOther").val('');
            $("#txtHousingOther").focus();
            return false;
        }

        if (parseInt($('#txtLoansLYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyLoansSourceLYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtLoansCYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyLoansSourceCYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtIncomeOtherLYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyIncomeOtherSourceLYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtIncomeOtherCYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyIncomeOtherSourceCYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        return true;
    };

    /**
    * Occurs when click previous button
    */
    $('#btnPrev').click(function () {
        $('#divValidExpensesContent').fadeOut(1000);
        $('#divValidIncomeContent').fadeIn(1000);
        $("html, body").animate({ scrollTop: 0 }, 1000);
    });

    /**
    * Occurs when click submit button
    */
    $('#btnSubmit').click(function () {
        if ($(this).validateExpensesFields() == true) {
            return true;
        }
        else {
            alert(ALERT_STRING_FILLOUT);
            return false;
        }
    });

    /**
    * Validates required fields in expenses page
    */
    $.fn.validateExpensesFields = function () {
        var result = true;

        if ($('#radShareLivingYes').attr('checked') != 'checked' && $('#radShareLivingNo').attr('checked') != 'checked') {
            $('#radShareLivingNo').focus();
            return false;
        }

        if ($('#radShareLivingYes').attr('checked') == 'checked') {
            result = true;
            $('tr td input', '#tbodyShareLiving').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if ($('#radPayRentYes').attr('checked') != 'checked' && $('#radPayRentNo').attr('checked') != 'checked') {
            $('#radPayRentNo').focus();
            return false;
        }

        if ($('#radPayRentNo').attr('checked') == 'checked' && $('#radPayMortgageNo').attr('checked') == 'checked' && $.trim($('#txtNeitherRentOrMortgage').val()).length <= 0) {
            $('#txtNeitherRentOrMortgage').val('');
            $('#txtNeitherRentOrMortgage').focus();
            return false;
        }

        if ($('#radPayMortgageYes').attr('checked') != 'checked' && $('#radPayMortgageNo').attr('checked') != 'checked') {
            $('#radPayMortgageNo').focus();
            return false;
        }

        if ($('#radPayMortgageYes').attr('checked') == 'checked' && $('#radPayMortgageCurrentYes').attr('checked') != 'checked' && $('#radPayMortgageCurrentNo').attr('checked') != 'checked') {
            $('#radPayMortgageCurrentNo').focus();
            return false;
        }

        if ($('#radPayMortgageYes').attr('checked') == 'checked' && $('#radPayMortgageCurrentNo').attr('checked') == 'checked' && $.trim($('#txtPaymentsNotCurrent').val()).length <= 0) {
            $('#txtPaymentsNotCurrent').val('');
            $('#txtPaymentsNotCurrent').focus();
            return false;
        }

        // Validate all auto fields
        $('input[type!=hidden]').filter('.auto').each(function (index) {
            if ($(this).is(':visible') && $(this).val().length <= 0) {
                $(this).focus();
                result = false;
                return false; // break
            }
        });
        if (result == false)
            return false;

        if (parseInt($('#txtCarLYRAvg').autoNumericGet()) > 0 || parseInt($('#txtCarCYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyCar').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtPersonalLYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyPersonalSourceLYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtPersonalCYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyPersonalSourceCYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtExpensesOtherLYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyExpensesOtherSourceLYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtExpensesOtherCYRAvg').autoNumericGet()) > 0) {
            result = true;
            $('tr td input', '#tbodyExpensesOtherSourceCYR').each(function (index) {
                if ($.trim($(this).val()).length <= 0) {
                    $(this).val('');
                    $(this).focus();
                    result = false;
                    return false; // break
                }
            });
            if (result == false)
                return false;
        }

        if (parseInt($('#txtIncomeTotalLYRAvg').autoNumericGet()) < parseInt($('#txtExpensesTotalLYRAvg').autoNumericGet()) &&
            $.trim($('#txtRemainingExpensesExplain').val()).length <= 0) {
            $('#txtRemainingExpensesExplain').val('');
            setTimeout(function () { $('#txtRemainingExpensesExplain').select(); }, 50);
            return false;
        }

        return true;
    };

    /**
    * For remaining characters
    */
    $.fn.textCounter = function (field, countfield, maxlimit) {
        if (field.value.length > maxlimit) {
            field.value = field.value.substring(0, maxlimit);
            return false;
        }
        else {
            countfield.value = maxlimit - field.value.length;
        }
    };

    /**
    * Set auto field after check a field value (chkfield)
    */
    $.fn.setAutoField = function (chkfield, field, value) {
        if (chkfield.val().length > 0)
            field.autoNumericSet(value);
        else
            field.val('');
    };

    /**
    * Set auto field after check two field values (chkfield1 and chkfield2)
    */
    $.fn.setAutoField2 = function (chkfield1, chkfield2, field, value) {
        if (chkfield1.val().length > 0 || chkfield2.val().length > 0)
            field.autoNumericSet(value);
        else
            field.val('');
    };

    /**
    * Updates all of non-editable income fields
    */
    $.fn.updateIncomeFields = function () {
        $(this).setAutoField($('#txtFatherLYRAvg'), $('#txtFatherLYRAnn'), parseInt($('#txtFatherLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField2($('#txtFatherToDate'), $('#txtFatherEstimate'), $('#txtFatherCYRAnn'), parseInt($('#txtFatherToDate').autoNumericGet()) + parseInt($('#txtFatherEstimate').autoNumericGet()));
        $(this).setAutoField($('#txtFatherCYRAnn'), $('#txtFatherCYRAvg'), Math.round(parseInt($('#txtFatherCYRAnn').autoNumericGet()) / 12));

        $(this).setAutoField($('#txtMotherLYRAvg'), $('#txtMotherLYRAnn'), parseInt($('#txtMotherLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField2($('#txtMotherToDate'), $('#txtMotherEstimate'), $('#txtMotherCYRAnn'), parseInt($('#txtMotherToDate').autoNumericGet()) + parseInt($('#txtMotherEstimate').autoNumericGet()));
        $(this).setAutoField($('#txtMotherCYRAnn'), $('#txtMotherCYRAvg'), Math.round(parseInt($('#txtMotherCYRAnn').autoNumericGet()) / 12));

        $(this).setAutoField($('#txtGrossBusinessLYRAvg'), $('#txtGrossBusinessLYRAnn'), parseInt($('#txtGrossBusinessLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtGrossBusinessCYRAvg'), $('#txtGrossBusinessCYRAnn'), parseInt($('#txtGrossBusinessCYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtExpensesBusinessLYRAvg'), $('#txtExpensesBusinessLYRAnn'), parseInt($('#txtExpensesBusinessLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtExpensesBusinessCYRAvg'), $('#txtExpensesBusinessCYRAnn'), parseInt($('#txtExpensesBusinessCYRAvg').autoNumericGet() * 12));
        $(this).setAutoField2($('#txtGrossBusinessLYRAvg'), $('#txtExpensesBusinessLYRAvg'), $('#txtNetBusinessLYRAvg'), parseInt($('#txtGrossBusinessLYRAvg').autoNumericGet()) - parseInt($('#txtExpensesBusinessLYRAvg').autoNumericGet()));
        $(this).setAutoField($('#txtNetBusinessLYRAvg'), $('#txtNetBusinessLYRAnn'), parseInt($('#txtNetBusinessLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField2($('#txtGrossBusinessCYRAvg'), $('#txtExpensesBusinessCYRAvg'), $('#txtNetBusinessCYRAvg'), parseInt($('#txtGrossBusinessCYRAvg').autoNumericGet()) - parseInt($('#txtExpensesBusinessCYRAvg').autoNumericGet()));
        $(this).setAutoField($('#txtNetBusinessCYRAvg'), $('#txtNetBusinessCYRAnn'), parseInt($('#txtNetBusinessCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtGrossRentalLYRAvg'), $('#txtGrossRentalLYRAnn'), parseInt($('#txtGrossRentalLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtGrossRentalCYRAvg'), $('#txtGrossRentalCYRAnn'), parseInt($('#txtGrossRentalCYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtExpensesRentalLYRAvg'), $('#txtExpensesRentalLYRAnn'), parseInt($('#txtExpensesRentalLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtExpensesRentalCYRAvg'), $('#txtExpensesRentalCYRAnn'), parseInt($('#txtExpensesRentalCYRAvg').autoNumericGet() * 12));
        $(this).setAutoField2($('#txtGrossRentalLYRAvg'), $('#txtExpensesRentalLYRAvg'), $('#txtNetRentalLYRAvg'), parseInt($('#txtGrossRentalLYRAvg').autoNumericGet()) - parseInt($('#txtExpensesRentalLYRAvg').autoNumericGet()));
        $(this).setAutoField($('#txtNetRentalLYRAvg'), $('#txtNetRentalLYRAnn'), parseInt($('#txtNetRentalLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField2($('#txtGrossRentalCYRAvg'), $('#txtExpensesRentalCYRAvg'), $('#txtNetRentalCYRAvg'), parseInt($('#txtGrossRentalCYRAvg').autoNumericGet()) - parseInt($('#txtExpensesRentalCYRAvg').autoNumericGet()));
        $(this).setAutoField($('#txtNetRentalCYRAvg'), $('#txtNetRentalCYRAnn'), parseInt($('#txtNetRentalCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtInterestLYRAvg'), $('#txtInterestLYRAnn'), parseInt($('#txtInterestLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtInterestCYRAvg'), $('#txtInterestCYRAnn'), parseInt($('#txtInterestCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtCapitalLYRAvg'), $('#txtCapitalLYRAnn'), parseInt($('#txtCapitalLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtCapitalCYRAvg'), $('#txtCapitalCYRAnn'), parseInt($('#txtCapitalCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtSocialLYRAvg'), $('#txtSocialLYRAnn'), parseInt($('#txtSocialLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtSocialCYRAvg'), $('#txtSocialCYRAnn'), parseInt($('#txtSocialCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtPensionLYRAvg'), $('#txtPensionLYRAnn'), parseInt($('#txtPensionLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtPensionCYRAvg'), $('#txtPensionCYRAnn'), parseInt($('#txtPensionCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtAlimonyLYRAvg'), $('#txtAlimonyLYRAnn'), parseInt($('#txtAlimonyLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtAlimonyCYRAvg'), $('#txtAlimonyCYRAnn'), parseInt($('#txtAlimonyCYRAvg').autoNumericGet() * 12));

        var total = 0, lyrAvg = 0, lyrAnn = 0, cyrAvg = 0, cyrAnn = 0;
        var startMonth = parseInt($('#selUnemploymentBeginMonth').val());
        var startYear = parseInt($('#selUnemploymentBeginYear').val());
        var endMonth = parseInt($('#selUnemploymentExpiryMonth').val());
        var endYear = parseInt($('#selUnemploymentExpiryYear').val());
        if (parseInt($('#txtUnemploymentTotal').autoNumericGet()) > 0 && startMonth > 0 && startYear > 0 && endMonth > 0 && endYear > 0) {
            var currentYear = parseInt($('#currentSystemYear').val());
            var currentMonth = parseInt($('#currentSystemMonth').val());

            var startDate = new Date(startYear, startMonth - 1, 1);
            var endDate = new Date(endYear, endMonth - 1, 1);

            if (startDate > endDate) {
                alert(ALERT_STRING_BENEFIT);
                $('#selUnemploymentExpiryMonth').val('0');
                $('#selUnemploymentExpiryYear').val('0');
                $('#selUnemploymentExpiryMonth').focus();

                lyrAvg = 0;
                lyrAnn = 0;
                cyrAvg = 0;
                cyrAnn = 0;
            }
            else {
                total = parseInt($('#txtUnemploymentTotal').autoNumericGet());
                lyrAvg = total;
                cyrAvg = total;

                if (startDate.getFullYear() < currentYear - 1) {
                    if (endDate.getFullYear() < currentYear) {
                        lyrAnn = total * (endDate.getMonth() + 1); ;
                        cyrAnn = 0;
                    }
                    else if (endDate.getFullYear() == currentYear) {
                        lyrAnn = total * 12;
                        cyrAnn = total * (endDate.getMonth() + 1);
                    }
                    else if (endDate.getFullYear() > currentYear) {
                        lyrAnn = total * 12;
                        cyrAnn = total * 12;
                    }
                }
                else if (startDate.getFullYear() == currentYear - 1) {
                    if (endDate.getFullYear() < currentYear) {
                        lyrAnn = total * (endDate.getMonth() - startDate.getMonth() + 1);
                        cyrAnn = 0;
                    }
                    else if (endDate.getFullYear() == currentYear) {
                        lyrAnn = total * (12 - startDate.getMonth());
                        cyrAnn = total * (endDate.getMonth() + 1);
                    }
                    else if (endDate.getFullYear() > currentYear) {
                        lyrAnn = total * (12 - startDate.getMonth());
                        cyrAnn = total * 12;
                    }
                }
                else if (startDate.getFullYear() == currentYear) {
                    lyrAvg = 0;
                    lyrAnn = 0;
                    if (endDate.getFullYear() == currentYear) {
                        cyrAnn = total * (endDate.getMonth() - startDate.getMonth() + 1);
                    }
                    else if (endDate.getFullYear() > currentYear) {
                        cyrAnn = total * 12;
                    }
                }
            }
        }
        $(this).setAutoField($('#txtUnemploymentTotal'), $('#txtUnemploymentLYRAvg'), Math.round(parseInt(lyrAnn) / 12));
        $(this).setAutoField($('#txtUnemploymentTotal'), $('#txtUnemploymentLYRAnn'), parseInt(lyrAnn));
        $(this).setAutoField($('#txtUnemploymentTotal'), $('#txtUnemploymentCYRAvg'), Math.round(parseInt(cyrAnn) / 12));
        $(this).setAutoField($('#txtUnemploymentTotal'), $('#txtUnemploymentCYRAnn'), parseInt(cyrAnn));

        if (parseInt($('#txtUnemploymentTotal').autoNumericGet()) > 0) {
            if (!$('#divUnemploymentDates').is(':visible')) {
                $('#divUnemploymentDates').fadeIn();
                $('#selUnemploymentBeginMonth').focus();
            }
        }
        else {
            if ($('#divUnemploymentDates').is(':visible')) {
                $('#divUnemploymentDates').fadeOut();
                $('#txtPayLYRAvg').focus();
            }
        }

        $(this).setAutoField($('#txtPayLYRAvg'), $('#txtPayLYRAnn'), parseInt($('#txtPayLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtPayCYRAvg'), $('#txtPayCYRAnn'), parseInt($('#txtPayCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtCompensationLYRAvg'), $('#txtCompensationLYRAnn'), parseInt($('#txtCompensationLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtCompensationCYRAvg'), $('#txtCompensationCYRAnn'), parseInt($('#txtCompensationCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtFamiliesLYRAvg'), $('#txtFamiliesLYRAnn'), parseInt($('#txtFamiliesLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtFamiliesCYRAvg'), $('#txtFamiliesCYRAnn'), parseInt($('#txtFamiliesCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtChildrenLYRAvg'), $('#txtChildrenLYRAnn'), parseInt($('#txtChildrenLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtChildrenCYRAvg'), $('#txtChildrenCYRAnn'), parseInt($('#txtChildrenCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtVeteransLYRAvg'), $('#txtVeteransLYRAnn'), parseInt($('#txtVeteransLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtVeteransCYRAvg'), $('#txtVeteransCYRAnn'), parseInt($('#txtVeteransCYRAvg').autoNumericGet() * 12));

        if (parseInt($('#txtVeteransLYRAvg').autoNumericGet()) > 0) {
            $('#divVeteransSourceLYR').fadeIn();
        }
        else {
            $('#divVeteransSourceLYR').fadeOut();
        }

        if (parseInt($('#txtVeteransCYRAvg').autoNumericGet()) > 0) {
            $('#divVeteransSourceCYR').fadeIn();
        }
        else {
            $('#divVeteransSourceCYR').fadeOut();
        }

        $(this).setAutoField($('#txtCashLYRAvg'), $('#txtCashLYRAnn'), parseInt($('#txtCashLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtCashCYRAvg'), $('#txtCashCYRAnn'), parseInt($('#txtCashCYRAvg').autoNumericGet() * 12));

        if (parseInt($('#txtCashLYRAvg').autoNumericGet()) > 0) {
            $('#divCashSourceLYR').fadeIn();
        }
        else {
            $('#divCashSourceLYR').fadeOut();
        }

        if (parseInt($('#txtCashCYRAvg').autoNumericGet()) > 0) {
            $('#divCashSourceCYR').fadeIn();
        }
        else {
            $('#divCashSourceCYR').fadeOut();
        }

        $(this).setAutoField($('#txtHousingLYRAvg'), $('#txtHousingLYRAnn'), parseInt($('#txtHousingLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtHousingCYRAvg'), $('#txtHousingCYRAnn'), parseInt($('#txtHousingCYRAvg').autoNumericGet() * 12));
        if ($('#radHousingMilitary').attr('checked') == 'checked') {
            $(this).setAutoField($('#txtHousingLYRAvg2'), $('#txtHousingLYRAnn2'), parseInt($('#txtHousingLYRAvg2').autoNumericGet() * 12));
            $(this).setAutoField($('#txtHousingCYRAvg2'), $('#txtHousingCYRAnn2'), parseInt($('#txtHousingCYRAvg2').autoNumericGet() * 12));
        }

        if (parseInt($('#txtHousingLYRAvg').autoNumericGet()) > 0 || parseInt($('#txtHousingCYRAvg').autoNumericGet()) > 0) {
            $('#divHousingSource').fadeIn();
        }
        else if ($('#radHousingMilitary').attr('checked') != 'checked') {
            $('#divHousingSource').fadeOut();
        }

        $(this).setAutoField($('#txtTaxLYRAvg'), $('#txtTaxLYRAnn'), parseInt($('#txtTaxLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtTaxCYRAvg'), $('#txtTaxCYRAnn'), parseInt($('#txtTaxCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtLoansLYRAvg'), $('#txtLoansLYRAnn'), parseInt($('#txtLoansLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtLoansCYRAvg'), $('#txtLoansCYRAnn'), parseInt($('#txtLoansCYRAvg').autoNumericGet() * 12));

        if (parseInt($('#txtLoansLYRAvg').autoNumericGet()) > 0) {
            $('#divLoansSourceLYR').fadeIn();
        }
        else {
            $('#divLoansSourceLYR').fadeOut();
        }

        if (parseInt($('#txtLoansCYRAvg').autoNumericGet()) > 0) {
            $('#divLoansSourceCYR').fadeIn();
        }
        else {
            $('#divLoansSourceCYR').fadeOut();
        }

        $(this).setAutoField($('#txtIncomeCreditLYRAvg'), $('#txtIncomeCreditLYRAnn'), parseInt($('#txtIncomeCreditLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtIncomeCreditCYRAvg'), $('#txtIncomeCreditCYRAnn'), parseInt($('#txtIncomeCreditCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtIncomeOtherLYRAvg'), $('#txtIncomeOtherLYRAnn'), parseInt($('#txtIncomeOtherLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtIncomeOtherCYRAvg'), $('#txtIncomeOtherCYRAnn'), parseInt($('#txtIncomeOtherCYRAvg').autoNumericGet() * 12));

        if (parseInt($('#txtIncomeOtherLYRAvg').autoNumericGet()) > 0) {
            $('#divIncomeOtherSourceLYR').fadeIn();
        }
        else {
            $('#divIncomeOtherSourceLYR').fadeOut();
        }

        if (parseInt($('#txtIncomeOtherCYRAvg').autoNumericGet()) > 0) {
            $('#divIncomeOtherSourceCYR').fadeIn();
        }
        else {
            $('#divIncomeOtherSourceCYR').fadeOut();
        }

        $('#txtIncomeTotalLYRAvg').autoNumericSet(
            parseInt($('#txtFatherLYRAvg').autoNumericGet()) +
            parseInt($('#txtMotherLYRAvg').autoNumericGet()) +
            parseInt($('#txtNetBusinessLYRAvg').autoNumericGet()) +
            parseInt($('#txtNetRentalLYRAvg').autoNumericGet()) +
            parseInt($('#txtInterestLYRAvg').autoNumericGet()) +
            parseInt($('#txtCapitalLYRAvg').autoNumericGet()) +
            parseInt($('#txtSocialLYRAvg').autoNumericGet()) +
            parseInt($('#txtPensionLYRAvg').autoNumericGet()) +
            parseInt($('#txtAlimonyLYRAvg').autoNumericGet()) +
            parseInt($('#txtUnemploymentLYRAvg').autoNumericGet()) +
            parseInt($('#txtPayLYRAvg').autoNumericGet()) +
            parseInt($('#txtCompensationLYRAvg').autoNumericGet()) +
            parseInt($('#txtFamiliesLYRAvg').autoNumericGet()) +
            parseInt($('#txtChildrenLYRAvg').autoNumericGet()) +
            parseInt($('#txtVeteransLYRAvg').autoNumericGet()) +
            parseInt($('#txtCashLYRAvg').autoNumericGet()) +
            parseInt($('#txtHousingLYRAvg').autoNumericGet()) +
            (($('#radHousingMilitary').attr('checked') == 'checked') ? parseInt($('#txtHousingLYRAvg2').autoNumericGet()) : 0) +
            parseInt($('#txtLoansLYRAvg').autoNumericGet()) +
            parseInt($('#txtIncomeCreditLYRAvg').autoNumericGet()) +
            parseInt($('#txtIncomeOtherLYRAvg').autoNumericGet())
        );

        $('#txtIncomeTotalLYRAnn').autoNumericSet(
            parseInt($('#txtFatherLYRAnn').autoNumericGet()) +
            parseInt($('#txtMotherLYRAnn').autoNumericGet()) +
            parseInt($('#txtNetBusinessLYRAnn').autoNumericGet()) +
            parseInt($('#txtNetRentalLYRAnn').autoNumericGet()) +
            parseInt($('#txtInterestLYRAnn').autoNumericGet()) +
            parseInt($('#txtCapitalLYRAnn').autoNumericGet()) +
            parseInt($('#txtSocialLYRAnn').autoNumericGet()) +
            parseInt($('#txtPensionLYRAnn').autoNumericGet()) +
            parseInt($('#txtAlimonyLYRAnn').autoNumericGet()) +
            parseInt($('#txtUnemploymentLYRAnn').autoNumericGet()) +
            parseInt($('#txtPayLYRAnn').autoNumericGet()) +
            parseInt($('#txtCompensationLYRAnn').autoNumericGet()) +
            parseInt($('#txtFamiliesLYRAnn').autoNumericGet()) +
            parseInt($('#txtChildrenLYRAnn').autoNumericGet()) +
            parseInt($('#txtVeteransLYRAnn').autoNumericGet()) +
            parseInt($('#txtCashLYRAnn').autoNumericGet()) +
            parseInt($('#txtHousingLYRAnn').autoNumericGet()) +
            (($('#radHousingMilitary').attr('checked') == 'checked') ? parseInt($('#txtHousingLYRAnn2').autoNumericGet()) : 0) +
            parseInt($('#txtLoansLYRAnn').autoNumericGet()) +
            parseInt($('#txtIncomeCreditLYRAnn').autoNumericGet()) +
            parseInt($('#txtIncomeOtherLYRAnn').autoNumericGet())
        );

        $('#txtIncomeTotalCYRAvg').autoNumericSet(
            parseInt($('#txtFatherCYRAvg').autoNumericGet()) +
            parseInt($('#txtMotherCYRAvg').autoNumericGet()) +
            parseInt($('#txtNetBusinessCYRAvg').autoNumericGet()) +
            parseInt($('#txtNetRentalCYRAvg').autoNumericGet()) +
            parseInt($('#txtInterestCYRAvg').autoNumericGet()) +
            parseInt($('#txtCapitalCYRAvg').autoNumericGet()) +
            parseInt($('#txtSocialCYRAvg').autoNumericGet()) +
            parseInt($('#txtPensionCYRAvg').autoNumericGet()) +
            parseInt($('#txtAlimonyCYRAvg').autoNumericGet()) +
            parseInt($('#txtUnemploymentCYRAvg').autoNumericGet()) +
            parseInt($('#txtPayCYRAvg').autoNumericGet()) +
            parseInt($('#txtCompensationCYRAvg').autoNumericGet()) +
            parseInt($('#txtFamiliesCYRAvg').autoNumericGet()) +
            parseInt($('#txtChildrenCYRAvg').autoNumericGet()) +
            parseInt($('#txtVeteransCYRAvg').autoNumericGet()) +
            parseInt($('#txtCashCYRAvg').autoNumericGet()) +
            parseInt($('#txtHousingCYRAvg').autoNumericGet()) +
            (($('#radHousingMilitary').attr('checked') == 'checked') ? parseInt($('#txtHousingCYRAvg2').autoNumericGet()) : 0) +
            parseInt($('#txtLoansCYRAvg').autoNumericGet()) +
            parseInt($('#txtIncomeCreditCYRAvg').autoNumericGet()) +
            parseInt($('#txtIncomeOtherCYRAvg').autoNumericGet())
        );

        $('#txtIncomeTotalCYRAnn').autoNumericSet(
            parseInt($('#txtFatherCYRAnn').autoNumericGet()) +
            parseInt($('#txtMotherCYRAnn').autoNumericGet()) +
            parseInt($('#txtNetBusinessCYRAnn').autoNumericGet()) +
            parseInt($('#txtNetRentalCYRAnn').autoNumericGet()) +
            parseInt($('#txtInterestCYRAnn').autoNumericGet()) +
            parseInt($('#txtCapitalCYRAnn').autoNumericGet()) +
            parseInt($('#txtSocialCYRAnn').autoNumericGet()) +
            parseInt($('#txtPensionCYRAnn').autoNumericGet()) +
            parseInt($('#txtAlimonyCYRAnn').autoNumericGet()) +
            parseInt($('#txtUnemploymentCYRAnn').autoNumericGet()) +
            parseInt($('#txtPayCYRAnn').autoNumericGet()) +
            parseInt($('#txtCompensationCYRAnn').autoNumericGet()) +
            parseInt($('#txtFamiliesCYRAnn').autoNumericGet()) +
            parseInt($('#txtChildrenCYRAnn').autoNumericGet()) +
            parseInt($('#txtVeteransCYRAnn').autoNumericGet()) +
            parseInt($('#txtCashCYRAnn').autoNumericGet()) +
            parseInt($('#txtHousingCYRAnn').autoNumericGet()) +
            (($('#radHousingMilitary').attr('checked') == 'checked') ? parseInt($('#txtHousingCYRAnn2').autoNumericGet()) : 0) +
            parseInt($('#txtLoansCYRAnn').autoNumericGet()) +
            parseInt($('#txtIncomeCreditCYRAnn').autoNumericGet()) +
            parseInt($('#txtIncomeOtherCYRAnn').autoNumericGet())
        );
    };

    /**
    * Occurs when change housing options
    */
    $.fn.changeHousingOptions = function (selectedItem) {
        if (selectedItem == 'clergy') {
            $('#trHousingOther').fadeOut();

            $('#divHousingBAH1').fadeOut();
            $('#divHousingBAS1').fadeOut();
            $('#divHousingBAH2').fadeOut();
            $('#divHousingBAS2').fadeOut();
            $('#divHousingBAH3').fadeOut();
            $('#divHousingBAS3').fadeOut();
            $('#divHousingBAH4').fadeOut();
            $('#divHousingBAS4').fadeOut();
        }
        else if (selectedItem == 'military') {
            $('#trHousingOther').fadeOut();

            $('#divHousingBAH1').fadeIn();
            $('#divHousingBAS1').fadeIn();
            $('#divHousingBAH2').fadeIn();
            $('#divHousingBAS2').fadeIn();
            $('#divHousingBAH3').fadeIn();
            $('#divHousingBAS3').fadeIn();
            $('#divHousingBAH4').fadeIn();
            $('#divHousingBAS4').fadeIn();
        }
        else {
            $('#trHousingOther').fadeIn();

            $('#divHousingBAH1').fadeOut();
            $('#divHousingBAS1').fadeOut();
            $('#divHousingBAH2').fadeOut();
            $('#divHousingBAS2').fadeOut();
            $('#divHousingBAH3').fadeOut();
            $('#divHousingBAS3').fadeOut();
            $('#divHousingBAH4').fadeOut();
            $('#divHousingBAS4').fadeOut();
        }
        $(this).updateIncomeFields();
    };

    /**
    * Updates all of non-editable expenses fields
    */
    $.fn.updateExpensesFields = function () {
        $(this).setAutoField($('#txtChildSupportLYRAvg'), $('#txtChildSupportLYRAnn'), parseInt($('#txtChildSupportLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtChildSupportCYRAvg'), $('#txtChildSupportCYRAnn'), parseInt($('#txtChildSupportCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtHomeLYRAvg'), $('#txtHomeLYRAnn'), parseInt($('#txtHomeLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtHomeCYRAvg'), $('#txtHomeCYRAnn'), parseInt($('#txtHomeCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtPropertyTaxLYRAvg'), $('#txtPropertyTaxLYRAnn'), parseInt($('#txtPropertyTaxLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtPropertyTaxCYRAvg'), $('#txtPropertyTaxCYRAnn'), parseInt($('#txtPropertyTaxCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtFoodLYRAvg'), $('#txtFoodLYRAnn'), parseInt($('#txtFoodLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtFoodCYRAvg'), $('#txtFoodCYRAnn'), parseInt($('#txtFoodCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtUtilitiesLYRAvg'), $('#txtUtilitiesLYRAnn'), parseInt($('#txtUtilitiesLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtUtilitiesCYRAvg'), $('#txtUtilitiesCYRAnn'), parseInt($('#txtUtilitiesCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtPhoneLYRAvg'), $('#txtPhoneLYRAnn'), parseInt($('#txtPhoneLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtPhoneCYRAvg'), $('#txtPhoneCYRAnn'), parseInt($('#txtPhoneCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtClothingLYRAvg'), $('#txtClothingLYRAnn'), parseInt($('#txtClothingLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtClothingCYRAvg'), $('#txtClothingCYRAnn'), parseInt($('#txtClothingCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtChildCareLYRAvg'), $('#txtChildCareLYRAnn'), parseInt($('#txtChildCareLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtChildCareCYRAvg'), $('#txtChildCareCYRAnn'), parseInt($('#txtChildCareCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtPrivateLYRAvg'), $('#txtPrivateLYRAnn'), parseInt($('#txtPrivateLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtPrivateCYRAvg'), $('#txtPrivateCYRAnn'), parseInt($('#txtPrivateCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtInsuranceLYRAvg'), $('#txtInsuranceLYRAnn'), parseInt($('#txtInsuranceLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtInsuranceCYRAvg'), $('#txtInsuranceCYRAnn'), parseInt($('#txtInsuranceCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtMedicalLYRAvg'), $('#txtMedicalLYRAnn'), parseInt($('#txtMedicalLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtMedicalCYRAvg'), $('#txtMedicalCYRAnn'), parseInt($('#txtMedicalCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtGasolineLYRAvg'), $('#txtGasolineLYRAnn'), parseInt($('#txtGasolineLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtGasolineCYRAvg'), $('#txtGasolineCYRAnn'), parseInt($('#txtGasolineCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtExpensesCreditLYRAvg'), $('#txtExpensesCreditLYRAnn'), parseInt($('#txtExpensesCreditLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtExpensesCreditCYRAvg'), $('#txtExpensesCreditCYRAnn'), parseInt($('#txtExpensesCreditCYRAvg').autoNumericGet() * 12));

        $(this).setAutoField($('#txtPersonalLYRAvg'), $('#txtPersonalLYRAnn'), parseInt($('#txtPersonalLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtPersonalCYRAvg'), $('#txtPersonalCYRAnn'), parseInt($('#txtPersonalCYRAvg').autoNumericGet() * 12));

        if (parseInt($('#txtPersonalLYRAvg').autoNumericGet()) > 0) {
            $('#divPersonalSourceLYR').fadeIn();
        }
        else {
            $('#divPersonalSourceLYR').fadeOut();
        }

        if (parseInt($('#txtPersonalCYRAvg').autoNumericGet()) > 0) {
            $('#divPersonalSourceCYR').fadeIn();
        }
        else {
            $('#divPersonalSourceCYR').fadeOut();
        }

        $(this).setAutoField($('#txtExpensesOtherLYRAvg'), $('#txtExpensesOtherLYRAnn'), parseInt($('#txtExpensesOtherLYRAvg').autoNumericGet() * 12));
        $(this).setAutoField($('#txtExpensesOtherCYRAvg'), $('#txtExpensesOtherCYRAnn'), parseInt($('#txtExpensesOtherCYRAvg').autoNumericGet() * 12));

        if (parseInt($('#txtExpensesOtherLYRAvg').autoNumericGet()) > 0) {
            $('#divExpensesOtherExplainLYR').fadeIn();
        }
        else {
            $('#divExpensesOtherExplainLYR').fadeOut();
        }

        if (parseInt($('#txtExpensesOtherCYRAvg').autoNumericGet()) > 0) {
            $('#divExpensesOtherExplainCYR').fadeIn();
        }
        else {
            $('#divExpensesOtherExplainCYR').fadeOut();
        }

        $(this).calculateExpensesTotals();
    };

    /**
    * Updates car payments fields
    */
    $.fn.updateCarFields = function () {
        if (parseInt($('#txtCarLYRAvg').autoNumericGet()) > 0 || parseInt($('#txtCarCYRAvg').autoNumericGet()) > 0) {
            $('#lblCar1').show();
            $('#theadCar1').show();
            $('#tfootCar1').show();
            $('#lblCar2').show();
            $('#theadCar2').show();
            $('#tfootCar2').show();
            $('#lblCar3').show();
            $('#theadCar3').show();
            $('#tfootCar3').show();
            $('#lblCar4').show();
            $('#theadCar4').show();
            $('#tfootCar4').show();

            $('#divCarPayments').fadeIn();
        }
        else if ($('td', '#tbodyCar1').children().length == 1) {
            $('#lblCar1').hide();
            $('#theadCar1').hide();
            $('#tfootCar1').hide();
            $('#lblCar2').hide();
            $('#theadCar2').hide();
            $('#tfootCar2').hide();
            $('#lblCar3').hide();
            $('#theadCar3').hide();
            $('#tfootCar3').hide();
            $('#lblCar4').hide();
            $('#theadCar4').hide();
            $('#tfootCar4').hide();

            $('#divCarPayments').fadeOut();
        }

        var totalLYRAvg = 0.0;
        var totalLYRAnn = 0.0;
        $('td input', '#tbodyCar1').each(function (index) {
            thisLYRAvg = parseInt($(this).autoNumericGet())
            totalLYRAvg += thisLYRAvg;
            thisLYRAnn = thisLYRAvg * 12;
            totalLYRAnn += thisLYRAnn;
            $('td input', '#tbodyCar2').eq(index).autoNumericSet(thisLYRAnn);
        });
        $('#txtCarTotalLYRAvg').autoNumericSet(parseInt(totalLYRAvg));
        $('#txtCarTotalLYRAnn').autoNumericSet(parseInt(totalLYRAnn));

        var totalCYRAvg = 0.0;
        var totalCYRAnn = 0.0;
        $('td input', '#tbodyCar3').each(function (index) {
            thisCYRAvg = parseInt($(this).autoNumericGet())
            totalCYRAvg += thisCYRAvg;
            thisCYRAnn = thisCYRAvg * 12;
            totalCYRAnn += thisCYRAnn;
            $('td input', '#tbodyCar4').eq(index).autoNumericSet(thisCYRAnn);
        });
        $('#txtCarTotalCYRAvg').autoNumericSet(parseInt(totalCYRAvg));
        $('#txtCarTotalCYRAnn').autoNumericSet(parseInt(totalCYRAnn));

        $(this).calculateExpensesTotals();
    };

    /**
    * Calculates total amount of expenses
    */
    $.fn.calculateExpensesTotals = function () {
        $('#txtExpensesTotalLYRAvg').autoNumericSet(
                parseInt($('#txtChildSupportLYRAvg').autoNumericGet()) +
                parseInt($('#txtHomeLYRAvg').autoNumericGet()) +
                parseInt($('#txtPropertyTaxLYRAvg').autoNumericGet()) +
                parseInt($('#txtFoodLYRAvg').autoNumericGet()) +
                parseInt($('#txtUtilitiesLYRAvg').autoNumericGet()) +
                parseInt($('#txtPhoneLYRAvg').autoNumericGet()) +
                parseInt($('#txtClothingLYRAvg').autoNumericGet()) +
                parseInt($('#txtChildCareLYRAvg').autoNumericGet()) +
                parseInt($('#txtPrivateLYRAvg').autoNumericGet()) +
                parseInt($('#txtInsuranceLYRAvg').autoNumericGet()) +
                parseInt($('#txtMedicalLYRAvg').autoNumericGet()) +
                parseInt($('#txtGasolineLYRAvg').autoNumericGet()) +
                parseInt($('#txtCarTotalLYRAvg').autoNumericGet()) +
                parseInt($('#txtExpensesCreditLYRAvg').autoNumericGet()) +
                parseInt($('#txtPersonalLYRAvg').autoNumericGet()) +
                parseInt($('#txtExpensesOtherLYRAvg').autoNumericGet())
            );

        $('#txtExpensesTotalLYRAnn').autoNumericSet(
                parseInt($('#txtChildSupportLYRAnn').autoNumericGet()) +
                parseInt($('#txtHomeLYRAnn').autoNumericGet()) +
                parseInt($('#txtPropertyTaxLYRAnn').autoNumericGet()) +
                parseInt($('#txtFoodLYRAnn').autoNumericGet()) +
                parseInt($('#txtUtilitiesLYRAnn').autoNumericGet()) +
                parseInt($('#txtPhoneLYRAnn').autoNumericGet()) +
                parseInt($('#txtClothingLYRAnn').autoNumericGet()) +
                parseInt($('#txtChildCareLYRAnn').autoNumericGet()) +
                parseInt($('#txtPrivateLYRAnn').autoNumericGet()) +
                parseInt($('#txtInsuranceLYRAnn').autoNumericGet()) +
                parseInt($('#txtMedicalLYRAnn').autoNumericGet()) +
                parseInt($('#txtGasolineLYRAnn').autoNumericGet()) +
                parseInt($('#txtCarTotalLYRAnn').autoNumericGet()) +
                parseInt($('#txtExpensesCreditLYRAnn').autoNumericGet()) +
                parseInt($('#txtPersonalLYRAnn').autoNumericGet()) +
                parseInt($('#txtExpensesOtherLYRAnn').autoNumericGet())
            );

        $('#txtExpensesTotalCYRAvg').autoNumericSet(
                parseInt($('#txtChildSupportCYRAvg').autoNumericGet()) +
                parseInt($('#txtHomeCYRAvg').autoNumericGet()) +
                parseInt($('#txtPropertyTaxCYRAvg').autoNumericGet()) +
                parseInt($('#txtFoodCYRAvg').autoNumericGet()) +
                parseInt($('#txtUtilitiesCYRAvg').autoNumericGet()) +
                parseInt($('#txtPhoneCYRAvg').autoNumericGet()) +
                parseInt($('#txtClothingCYRAvg').autoNumericGet()) +
                parseInt($('#txtChildCareCYRAvg').autoNumericGet()) +
                parseInt($('#txtPrivateCYRAvg').autoNumericGet()) +
                parseInt($('#txtInsuranceCYRAvg').autoNumericGet()) +
                parseInt($('#txtMedicalCYRAvg').autoNumericGet()) +
                parseInt($('#txtGasolineCYRAvg').autoNumericGet()) +
                parseInt($('#txtCarTotalCYRAvg').autoNumericGet()) +
                parseInt($('#txtExpensesCreditCYRAvg').autoNumericGet()) +
                parseInt($('#txtPersonalCYRAvg').autoNumericGet()) +
                parseInt($('#txtExpensesOtherCYRAvg').autoNumericGet())
            );

        $('#txtExpensesTotalCYRAnn').autoNumericSet(
                parseInt($('#txtChildSupportCYRAnn').autoNumericGet()) +
                parseInt($('#txtHomeCYRAnn').autoNumericGet()) +
                parseInt($('#txtPropertyTaxCYRAnn').autoNumericGet()) +
                parseInt($('#txtFoodCYRAnn').autoNumericGet()) +
                parseInt($('#txtUtilitiesCYRAnn').autoNumericGet()) +
                parseInt($('#txtPhoneCYRAnn').autoNumericGet()) +
                parseInt($('#txtClothingCYRAnn').autoNumericGet()) +
                parseInt($('#txtChildCareCYRAnn').autoNumericGet()) +
                parseInt($('#txtPrivateCYRAnn').autoNumericGet()) +
                parseInt($('#txtInsuranceCYRAnn').autoNumericGet()) +
                parseInt($('#txtMedicalCYRAnn').autoNumericGet()) +
                parseInt($('#txtGasolineCYRAnn').autoNumericGet()) +
                parseInt($('#txtCarTotalCYRAnn').autoNumericGet()) +
                parseInt($('#txtExpensesCreditCYRAnn').autoNumericGet()) +
                parseInt($('#txtPersonalCYRAnn').autoNumericGet()) +
                parseInt($('#txtExpensesOtherCYRAnn').autoNumericGet())
            );

        $(this).displayRemaingDiv();
    };

    /**
    * Shows/hides #divRemainingExpenses
    */
    $.fn.displayRemaingDiv = function () {
        if (parseInt($('#txtIncomeTotalLYRAvg').autoNumericGet()) < parseInt($('#txtExpensesTotalLYRAvg').autoNumericGet()))
            $('#divRemainingExpenses').fadeIn();
        else
            $('#divRemainingExpenses').fadeOut();
    };

    /**
    * Occurs when change mortgage section
    */
    $.fn.changeMortgageSection = function () {
        if ($('#radPayMortgageYes').attr('checked') == 'checked') {
            $('#trPayMortgage').fadeIn();
            $(this).changePayMortgageCurrentSection();
        }
        else {
            $('#trPayMortgage').fadeOut();
            $('#trPayMortgageCurrent').fadeOut();
        }

        if ($('#radPayRentNo').attr('checked') == 'checked' && $('#radPayMortgageNo').attr('checked') == 'checked') {
            $('#divNeitherRentOrMortgage').fadeIn();
        }
        else {
            $('#divNeitherRentOrMortgage').fadeOut();
        }
    };

    /**
    * Occurs when change current mortgage payment section
    */
    $.fn.changePayMortgageCurrentSection = function () {
        if ($('#radPayMortgageCurrentNo').attr('checked') == 'checked') {
            $('#trPayMortgageCurrent').fadeIn();
        }
        else {
            $('#trPayMortgageCurrent').fadeOut();
        }
    }

    /**
    * Enables/disables submit button
    */
    $('#chkConfirmation').click(function () {
        if ($('#chkConfirmation').attr('checked') == 'checked')
            $('#btnSubmit').removeAttr("disabled");
        else
            $('#btnSubmit').attr("disabled", "disabled");
    });
});