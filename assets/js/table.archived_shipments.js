(function($) {
        var editor;
        $(document).ready(function() {
            /*[START] editor declaration section*/
            editor = new $.fn.dataTable.Editor({
                ajax: '/Ajax/ArchivedShipments',
                table: '#shipments',
                columnDefs: [{
                    type: 'datetime',
                    targets: [9, 10, 12]
                }],
                fields: [{ //1
                        label: "Status",
                        name: "archived_shipments.status",
                        type: "readonly"
                    },
                    { //2
                        label: "P/O#",
                        name: "archived_shipments.po"
                    },
                    { //3
                        label: "Product",
                        name: "archived_shipments.product_id",
                        type: "select",
                        placeholder: ""
                    },
                    { //4
                        label: "CN",
                        name: "archived_shipments.container_number",
                        type: "readonly"
                    },
                    { //5
                        label: "B/L",
                        name: "archived_shipments.bill_of_lading",
                        type: "readonly"
                    },
                    { //6
                        label: "Vendor",
                        name: "archived_shipments.vendor_id",
                        type: "select",
                        placeholder: ""
                    },
                    { //7
                        label: "Port",
                        name: "archived_shipments.discharge_port",
                        type: "readonly"
                    },
                    { //8
                        label: "Dest.",
                        name: "archived_shipments.final_destination",
                        type: "readonly"
                    },
                    { //9
                        label: "ETA",
                        name: "archived_shipments.eta",
                        type: "datetime",
                        format: 'MM-DD-YYYY'
                    },
                    { //10
                        label: "LFD",
                        name: "archived_shipments.lfd",
                        type: "datetime",
                        format: 'MM-DD-YYYY'
                    },
                    { //11
                        label: "Pickup Number",
                        name: "archived_shipments.pickup_number"
                    },
                    { //12
                        label: "Truck Date",
                        name: "archived_shipments.truck_date",
                        type: "datetime",
                        format: 'MM-DD-YYYY h:mm A'
                    },
                    { //13
                        label: "Truck Co.",
                        name: "archived_shipments.trucker_id",
                        type: "select",
                        placeholder: ""
                    },
                    { //14
                        label: "Container Size",
                        name: "archived_shipments.container_size",
                        type: "readonly"
                    },
                    { //15
                        label: "B/L Status",
                        name: "archived_shipments.bl_status",
                        type: "readonly"
                    },
                    { //16
                        label: "Freight",
                        name: "archived_shipments.freight",
                        type: "checkbox",
                        options: [{
                            label: "",
                            value: 1
                        }],
                        separator: '',
                        unselectedValue: 0
                    },
                    { //17
                        label: "ISF",
                        name: "archived_shipments.isf_required",
                        type: "checkbox",
                        options: [{
                            label: "",
                            value: 1
                        }],
                        separator: '',
                        unselectedValue: 0
                    },
                    { //18
                        label: "Customs",
                        name: "archived_shipments.customs",
                        type: "checkbox",
                        options: [{
                            label: "",
                            value: 1
                        }],
                        separator: '',
                        unselectedValue: 0
                    },
                    { //19
                        label: "PO",
                        name: "archived_shipments.po_boolean",
                        type: "checkbox",
                        options: [{
                            label: "",
                            value: 1
                        }],
                        separator: '',
                        unselectedValue: 0
                    },
                    { //20
                        label: "QB RT",
                        name: "archived_shipments.qb_rt",
                        type: "checkbox",
                        options: [{
                            label: "",
                            value: 1
                        }],
                        separator: '',
                        unselectedValue: 0
                    },
                    { //21
                        label: "QB WS",
                        name: "archived_shipments.qb_ws",
                        type: "checkbox",
                        options: [{
                            label: "",
                            value: 1
                        }],
                        separator: '',
                        unselectedValue: 0
                    },
                    { //22
                        label: "Vendor Payment",
                        name: "archived_shipments.requires_payment",
                        type: "checkbox",
                        options: [{
                            label: "",
                            value: 1
                        }],
                        separator: '',
                        unselectedValue: 0
                    },
                    { //23
                        label: "D.O.",
                        name: "archived_shipments.do",
                        type: "checkbox",
                        options: [{
                            label: "",
                            value: 1
                        }],
                        separator: '',
                        unselectedValue: 0
                    },
                    { //24
                        label: "Docs",
                        name: "archived_shipments.has_documents"
                    }
                ]
            });
            /*[END] editor declaration section*/

            function createCellPos(n) {
                var ordA = 'A'.charCodeAt(0);
                var ordZ = 'Z'.charCodeAt(0);
                var len = ordZ - ordA + 1;
                var s = "";
                while (n >= 0) {
                    s = String.fromCharCode(n % len + ordA) + s;
                    n = Math.floor(n / len) - 1;
                }
                return s;
            }
            // Setup - add a text input to each footer cell
            /* $('#shipments thead tr').clone(true).appendTo('#shipments thead');
             $('#shipments thead tr:eq(1) th').each(function(i) {
                 var title = $(this).text();
                 $(this).html('<input type="text" placeholder="Search ' + title + '" />');

                 $('input', this).on('keyup change', function() {
                     if (table.column(i).search() !== this.value) {
                         table
                             .column(i)
                             .search(this.value)
                             .draw();
                     }
                 });
             });
             
             * table.dataTable td.focus {
                 outline: 1px solid #ac1212;
                 outline-offset: -3px;
                 background-color: #f8e6e6 !important;
              }
             */
            /*[START] datatable declaration section*/
            var table = $('#shipments').DataTable({
                ajax: '/Ajax/Shipments',
                /*stateSave: true,*/
                pageLength: 100,
                displayLength: 100,
                /* fixedHeader: {
                     header: true,
                     footer: true
                 },
                 responsive: true,*/
                keys: true,
                fixedHeader: true,
                orderCellsTop: true,
                deferRender: true,
                lengthMenu: [
                    [5, 10, 25, 50, 100, -1],
                    [5, 10, 25, 50, 100, "All"]
                ],
                dom: 'Bfrtip',
                //responsive: 'true',
                columnDefs: [{
                        "defaultContent": " ",
                        "type": "non-empty-string",
                        "targets": "_all"
                    },
                    {
                        "targets": [24],
                        "visible": false,
                        "searchable": false
                    }
                ],
                select: "false",
                buttons: [
                    /*{
                                            extend: 'collection',
                                            text: 'Table control',
                                            buttons: [{
                                                    text: 'Toggle Select Column',
                                                    action: function(e, dt, node, config) {
                                                        dt.column(0).visible(!dt.column(0).visible());
                                                    }
                                                },
                                                {
                                                    text: 'Toggle Documents Column',
                                                    action: function(e, dt, node, config) {
                                                        dt.column(-1).visible(!dt.column(-1).visible());
                                                    }
                                                },
                                                'colvis',
                                                'colvisRestore'
                                            ]
                                        },*/
                    {
                        extend: 'copy',
                        text: 'Copy to clipboard'
                    },
                    {
                        text: 'Reload',
                        action: function(e, dt, node, config) {
                            dt.ajax.reload();
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        text: 'Save as PDF',
                        orientation: 'landscape',
                        title: 'Cargo Data',
                        exportOptions: {
                            modifier: {
                                page: 'current'
                            }
                        },
                        //download: 'open',
                        customize: function(doc) {
                            /*var cols = [];
                            cols[0] = {
                                text: 'Left part',
                                alignment: 'left',
                                margin: [20]
                            };
                            cols[1] = {
                                text: 'Right part',
                                alignment: 'right',
                                margin: [0, 0, 20]
                            };
                            var objFooter = {};
                            objFooter['columns'] = cols;
                            doc['footer'] = objFooter;*/
                            doc.content.splice(1, 0, {
                                margin: [0, 0, 0, 12],
                                alignment: 'center',
                                image: 'data:image/jpeg;base64,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'
                            });
                        }
                    },
                    {
                        extend: 'excelHtml5',
                        title: 'Cargo Data',
                        /*customize: function(xlsx) {
                            var sheet = xlsx.xl.worksheets['sheet1.xml'];
                            var lastCol = sheet.getElementsByTagName('col').length - 1;
                            var colRange = createCellPos(lastCol) + '1';
                            //Has to be done this way to avoid creation of unwanted namespace atributes.
                            var afSerializer = new XMLSerializer();
                            var xmlString = afSerializer.serializeToString(sheet);
                            var parser = new DOMParser();
                            var xmlDoc = parser.parseFromString(xmlString, 'text/xml');
                            var xlsxFilter = xmlDoc.createElementNS('http://schemas.openxmlformats.org/spreadsheetml/2006/main', 'autoFilter');
                            var filterAttr = xmlDoc.createAttribute('ref');
                            filterAttr.value = 'A1:' + colRange;
                            xlsxFilter.setAttributeNode(filterAttr);
                            sheet.getElementsByTagName('worksheet')[0].appendChild(xlsxFilter);
                        },*/
                        text: 'Save as Excel Spreadsheet',
                        exportOptions: {
                            modifier: {
                                page: 'current'
                            }
                        }
                    }
                ],
                columns: [
                    /*{ // Checkbox select column
                                            data: null,
                                            defaultContent: '',
                                            className: 'select-checkbox',
                                            orderable: false
                                        },*/
                    {
                        data: "archived_shipments.status",
                        render: function(data, type, row) {
                            var color = '';
                            var rowData = table.row(row).data();
                            if (type === 'display') {
                                if (rowData.is_complete == 1 || (rowData.qb_rt == 1 && rowData.qb_ws == 1)) {
                                    color = 'circle_disabled';
                                } else {
                                    if (data === '0') {
                                        color = 'circle_red';
                                    } else if (data === '1') {
                                        color = 'circle_yellow';
                                    } else if (data === '2') {
                                        color = 'circle_green';
                                    } else if (data === '3') {
                                        color = 'circle_disabled';
                                    }
                                }
                                return '<div id="status_div" class = \"' + color + '\"><p></p></div>';
                            }
                            return data;
                        }
                    },
                    {
                        data: "archived_shipments.po"
                    },
                    {
                        data: "products.product_name",
                        editField: "archived_shipments.product_id"
                    },
                    {
                        data: "archived_shipments.container_number"
                    },
                    {
                        data: "archived_shipments.bill_of_lading"
                    },
                    {
                        data: "vendors.abbreviation",
                        editField: "archived_shipments.vendor_id"
                    },
                    {
                        data: "archived_shipments.discharge_port"
                    },
                    {
                        data: "archived_shipments.final_destination"
                    },
                    {
                        data: "archived_shipments.eta"
                    },
                    {
                        data: "archived_shipments.lfd"
                    },
                    {
                        data: "archived_shipments.pickup_number"
                    },
                    {
                        data: "archived_shipments.truck_date"
                    },
                    {
                        data: "truckers.trucker_name",
                        editField: "archived_shipments.trucker_id"
                    },
                    {
                        data: "archived_shipments.container_size"
                    },
                    {
                        data: "archived_shipments.bl_status"
                    },
                    {
                        data: "archived_shipments.freight",
                        render: function(data, type, row) {
                            if (type === 'display') {
                                return '<input type="checkbox" id="editor-freight" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "archived_shipments.isf_required",
                        render: function(data, type, row) {
                            if (type === 'display') {
                                return '<input type="checkbox" id="editor-isfrequired" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "archived_shipments.customs",
                        render: function(data, type, row) {
                            if (type === 'display') {
                                return '<input type="checkbox" id="editor-customs" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "archived_shipments.po_boolean",
                        render: function(data, type, row) {
                            if (type === 'display') {
                                return '<input type="checkbox" id="editor-po_boolean" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "archived_shipments.qb_rt",
                        render: function(data, type, row) {
                            if (type === 'display') {
                                return '<input type="checkbox" id="editor-qb_rt" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "archived_shipments.qb_ws",
                        render: function(data, type, row) {
                            if (type === 'display') {
                                return '<input type="checkbox" id="editor-qb_ws" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    /*{data: "archived_shipments.latest_event"},
                    {data: "archived_shipments.latest_event_time_and_date"},*/
                    {
                        data: "archived_shipments.requires_payment",
                        render: function(data, type, row) {
                            if (type === 'display') {
                                return '<input type="checkbox" id="editor-requires_payment" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "archived_shipments.do",
                        render: function(data, type, row) {
                            if (type === 'display') {
                                return '<input type="checkbox" id="editor-do" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "archived_shipments.has_documents",
                        render: function(data, type, row) {
                            if (type === 'display') {
                                var rowData = table.row(row).data();
                                if (data == true) {
                                    return '<a href="/richfilemanager?expandedFolder=' + rowData.directory_name + '/' + '" target="_blank"><img src="/assets/folder_icon.png"></a>';
                                } else {
                                    //disabled_folder_icon
                                    return '<img src="/assets/folder_icon.png" class="disabled_folder_icon">';
                                }
                            }
                        }
                    }
                ],
                order: [
                    [8, 'asc'],
                    [5, 'asc'],
                    [1, 'asc']
                ],
                /*stateSaveCallback: function(settings, data) {
                    // Send an Ajax request to the server with the state object
                    $.ajax({
                        url: "/Ajax/save_state",
                        data: { name: "LIBRA", state: data },
                        dataType: "json",
                        type: "POST",
                        success: function() {}
                    });
                },
                stateLoadCallback: function(settings, callback) {
                    var o;
                    $.ajax({
                        url: '/Ajax/load_state',
                        data: { name: "LIBRA" },
                        dataType: 'json',
                        async: false,
                        type: "POST",
                        success: function(json) {
                            //callback( json );
                            o = json;
                        }
                    });
                    return o;
                },*/
                createdRow: function(row, data, dataIndex) {
                    if (data.archived_shipments.eta === '1970-01-01') {
                        data.archived_shipments.eta = '';
                    }
                    if (data.archived_shipments.bl_status === 'Hold') {
                        $("td:nth-child(15)", row).addClass("red_background");
                    } else {
                        $("td:nth-child(15)", row).removeClass("red_background");
                    }

                },
                rowCallback: function(row, data, displayNum, displayIndex, dataIndex) {
                    if ((data.archived_shipments.qb_rt == 1 && data.archived_shipments.qb_ws == 1) || data.archived_shipments.is_complete == 1) {
                        if (!$(row).hasClass("row_disabled")) $(row).addClass("row_disabled");
                        /*var currentData = table.row(this).data();
                        console.log(currentData);*/
                    } else {
                        if ($(row).hasClass("row_disabled")) $(row).removeClass("row_disabled");
                    }
                    if (data.archived_shipments.latest_event.includes('Empty Container Returned')) {
                        $("td:nth-child(1)", row).html('<div id="status_div" class = "circle_disabled"><p style="font-style:italic;margin-left: -11 !important;font-size:8px;text-align:center;display:block;color:#000000b5;">Empty Container Returned...</p></div>');
                        /*table.row(row)
                            .data(data)
                            .draw();*/
                    }
                    /*    if (data.archived_shipments.freight == 1 && data.archived_shipments.isf_required == 1 &&
                            data.archived_shipments.customs == 1 && data.archived_shipments.po_boolean == 1 &&
                            data.archived_shipments.qb_rt == 1 && data.archived_shipments.qb_ws == 1 &&
                            data.archived_shipments.requires_payment == 1 && data.archived_shipments.do == 1) {
                            data.archived_shipments.status = -1;
                            data.archived_shipments.is_complete = 1;
                            $(row).addClass("row_disabled");
                            editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                                .set('archived_shipments.status', -1)
                                .submit();
                        } else {
                            data.archived_shipments.status = 0;
                            data.archived_shipments.is_complete = 0;
                            $(row).removeClass("row_disabled");
                            var today = new Date();
                            var dd = today.getDate();
                            var mm = today.getMonth() + 1; //January is 0!
                            var yyyy = today.getFullYear();
                            var etaDate = new Date();
                            var ddEta = today.getDate();
                            var mmEta = today.getMonth() + 1; //January is 0!
                            var yyyyEta = today.getFullYear();
                            /*if (dd < 10) { dd = '0' + dd; }
                            if (mm < 10) { mm = '0' + mm; }
                            if (ddEta < 10) { ddEta = '0' + ddEta; }
                            if (mmEta < 10) { mmEta = '0' + mmEta; }
                            today = mm + '-' + dd + '-' + yyyy;
                            etaDate = mmEta + '-' + ddEta + '-' + yyyyEta;
                            var daysDifference = 0;
                            if (data.archived_shipments.eta === null) {
                                daysDifference = -1;
                            } else {
                                daysDifference = datediff(parseDate(today), parseDate(data.archived_shipments.eta));
                            }
                            var statusTranslation = 3;
                            if (daysDifference > 7) statusTranslation = 2;
                            else if (daysDifference > 3) statusTranslation = 1;
                            else if (daysDifference >= 0) statusTranslation = 0;
                            else statusTranslation = 3;
                            console.log("status: " + statusTranslation);
                            
                           
                    //                        console.log("DaysDifference: " + daysDifference);
                    editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                        .set('archived_shipments.status', 1)
                        .submit();*/

                    $('#editor-freight', row).prop('checked', data.archived_shipments.freight == 1);
                    $('#editor-isfrequired', row).prop('checked', data.archived_shipments.isf_required == 1);
                    $('#editor-customs', row).prop('checked', data.archived_shipments.customs == 1);
                    $('#editor-po_boolean', row).prop('checked', data.archived_shipments.po_boolean == 1);
                    $('#editor-qb_rt', row).prop('checked', data.archived_shipments.qb_rt == 1);
                    $('#editor-qb_ws', row).prop('checked', data.archived_shipments.qb_ws == 1);
                    $('#editor-requires_payment', row).prop('checked', data.archived_shipments.requires_payment == 1);
                    $('#editor-do', row).prop('checked', data.archived_shipments.do == 1);
                    if (data.archived_shipments.freight == 1) {
                        $("td:nth-child(16)", row).addClass("status_blue");
                        $("td:nth-child(16)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(16)", row).removeClass("status_blue");
                        $("td:nth-child(16)", row).addClass("status_red");
                    }
                    if (data.archived_shipments.isf_required == 1) {
                        $("td:nth-child(17)", row).addClass("status_blue");
                        $("td:nth-child(17)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(17)", row).removeClass("status_blue");
                        $("td:nth-child(17)", row).addClass("status_red");
                    }
                    if (data.archived_shipments.customs == 1) {
                        $("td:nth-child(18)", row).addClass("status_blue");
                        $("td:nth-child(18)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(18)", row).removeClass("status_blue");
                        $("td:nth-child(18)", row).addClass("status_red");
                    }
                    if (data.archived_shipments.po_boolean == 1) {
                        $("td:nth-child(19)", row).addClass("status_blue");
                        $("td:nth-child(19)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(19)", row).removeClass("status_blue");
                        $("td:nth-child(19)", row).addClass("status_red");
                    }
                    if (data.archived_shipments.qb_rt == 1) {
                        $("td:nth-child(20)", row).addClass("status_blue");
                        $("td:nth-child(20)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(20)", row).removeClass("status_blue");
                        $("td:nth-child(20)", row).addClass("status_red");
                    }
                    if (data.archived_shipments.qb_ws == 1) {
                        $("td:nth-child(21)", row).addClass("status_blue");
                        $("td:nth-child(21)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(21)", row).removeClass("status_blue");
                        $("td:nth-child(21)", row).addClass("status_red");
                    }
                    if (data.archived_shipments.qb_ws == 1 && data.archived_shipments.qb_rt == 1) {
                        $("td:first-child > div#status_div", row).removeClass("circle_green");
                        $("td:first-child > div#status_div", row).removeClass("circle_yellow");
                        $("td:first-child > div#status_div", row).removeClass("circle_red");
                        $("td:first-child > div#status_div", row).addClass("circle_disabled");
                    } else {
                        $("td:first-child > div#status_div", row).removeClass("circle_green");
                        $("td:first-child > div#status_div", row).removeClass("circle_yellow");
                        $("td:first-child > div#status_div", row).removeClass("circle_red");
                        $("td:first-child > div#status_div", row).removeClass("circle_disabled");
                        var today = new Date();
                        var dd = today.getDate();
                        var mm = today.getMonth() + 1; //January is 0!
                        var yyyy = today.getFullYear();
                        var etaDate = new Date();
                        var ddEta = today.getDate();
                        var mmEta = today.getMonth() + 1; //January is 0!
                        var yyyyEta = today.getFullYear();
                        if (dd < 10) { dd = '0' + dd; }
                        if (mm < 10) { mm = '0' + mm; }
                        if (ddEta < 10) { ddEta = '0' + ddEta; }
                        if (mmEta < 10) { mmEta = '0' + mmEta; }
                        today = mm + '-' + dd + '-' + yyyy;
                        etaDate = mmEta + '-' + ddEta + '-' + yyyyEta;
                        var daysDifference = 0;
                        if (data.archived_shipments.eta === null) {
                            daysDifference = -1;
                        } else {
                            daysDifference = datediff(parseDate(today), parseDate(data.archived_shipments.eta));
                        }
                        var statusTranslation = "circle_disabled";
                        if (daysDifference > 7) statusTranslation = "circle_green";
                        else if (daysDifference < 7 && daysDifference > 3) statusTranslation = "circle_yellow";
                        else if (daysDifference < 3 && daysDifference >= 0) statusTranslation = "circle_red";
                        else statusTranslation = "circle_disabled";
                        $("td:first-child > div#status_div", row).addClass(statusTranslation);
                    }
                    if (data.archived_shipments.requires_payment == 1) {
                        $("td:nth-child(22)", row).addClass("status_blue");
                        $("td:nth-child(22)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(22)", row).removeClass("status_blue");
                        $("td:nth-child(22)", row).addClass("status_red");
                    }
                    if (data.archived_shipments.do == 1) {
                        $("td:nth-child(23)", row).addClass("status_blue");
                        $("td:nth-child(23)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(23)", row).removeClass("status_blue");
                        $("td:nth-child(23)", row).addClass("status_red");
                    }
                }
            });
            /*[END] datatable declaration section*/

            // new Date("dateString") is browser-dependent and discouraged, so we'll write
            // a simple parse function for U.S. date format (which does no error checking)
            function parseDate(str) {
                var mdy = str.split('-');
                return new Date(mdy[2], mdy[0] - 1, mdy[1]);
            }

            function datediff(first, second) {
                // Take the difference between the dates and divide by milliseconds per day.
                // Round to nearest whole number to deal with DST.
                return Math.round((second - first) / (1000 * 60 * 60 * 24));
            }

            function updateStatus(row) {

            }
            jQuery.extend(jQuery.fn.dataTableExt.oSort, {
                "non-empty-string-asc": function(str1, str2) {
                    if (str1 == null || str1 == "")
                        return 1;
                    if (str2 == null || str2 == "")
                        return -1;
                    return ((str1 < str2) ? -1 : ((str1 > str2) ? 1 : 0));
                },

                "non-empty-string-desc": function(str1, str2) {
                    if (str1 == null || str1 == "")
                        return 1;
                    if (str2 == null || str2 == "")
                        return -1;
                    return ((str1 < str2) ? 1 : ((str1 > str2) ? -1 : 0));
                }
            });
            /*[START checkbox class change section]*/
            $('#shipments')
                .on('change', '#editor-freight',
                    function() {
                        editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                            .set('archived_shipments.freight', $(this).prop('checked') ? 1 : 0)
                            .submit();
                        $(this).closest('td').removeClass($(this).prop('checked') ? 'status_red' : "status_blue");
                        $(this).closest('td').addClass(($(this).prop('checked')) ? 'status_blue' : "status_red");
                        //var data = table.row($(this).parents('tr')).data();
                        $('#shipments').DataTable().ajax.reload(null, false);
                    }
                )
                .on('change', '#editor-isfrequired',
                    function() {
                        editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                            .set('archived_shipments.isf_required', $(this).prop('checked') ? 1 : 0)
                            .submit();
                        $(this).closest('td').removeClass($(this).prop('checked') ? 'status_red' : "status_blue");
                        $(this).closest('td').addClass(($(this).prop('checked')) ? 'status_blue' : "status_red");
                        //var data = table.row($(this).parents('tr')).data();
                    }
                )
                .on('change', '#editor-customs',
                    function() {
                        editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                            .set('archived_shipments.customs', $(this).prop('checked') ? 1 : 0)
                            .submit();
                        $(this).closest('td').removeClass($(this).prop('checked') ? 'status_red' : "status_blue");
                        $(this).closest('td').addClass(($(this).prop('checked')) ? 'status_blue' : "status_red");
                    }
                )
                .on('change', '#editor-po_boolean',
                    function() {
                        editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                            .set('archived_shipments.po_boolean', $(this).prop('checked') ? 1 : 0)
                            .submit();
                        $(this).closest('td').removeClass($(this).prop('checked') ? 'status_red' : "status_blue");
                        $(this).closest('td').addClass(($(this).prop('checked')) ? 'status_blue' : "status_red");
                    }
                )
                .on('change', '#editor-qb_rt',
                    function() {
                        editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                            .set('archived_shipments.qb_rt', $(this).prop('checked') ? 1 : 0)
                            .submit();
                        $(this).closest('td').removeClass($(this).prop('checked') ? 'status_red' : "status_blue");
                        $(this).closest('td').addClass(($(this).prop('checked')) ? 'status_blue' : "status_red");

                    }
                )
                .on('change', '#editor-qb_ws',
                    function() {
                        editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                            .set('archived_shipments.qb_ws', $(this).prop('checked') ? 1 : 0)
                            .submit();
                        $(this).closest('td').removeClass($(this).prop('checked') ? 'status_red' : "status_blue");
                        $(this).closest('td').addClass(($(this).prop('checked')) ? 'status_blue' : "status_red");
                    }
                )
                .on('change', '#editor-requires_payment',
                    function() {
                        editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                            .set('archived_shipments.requires_payment', $(this).prop('checked') ? 1 : 0)
                            .submit();
                        $(this).closest('td').removeClass($(this).prop('checked') ? 'status_red' : "status_blue");
                        $(this).closest('td').addClass(($(this).prop('checked')) ? 'status_blue' : "status_red");
                    }
                )
                .on('change', '#editor-do',
                    function() {
                        editor.edit($(this).closest('tr'), false, { submit: 'changed' })
                            .set('archived_shipments.do', $(this).prop('checked') ? 1 : 0)
                            .submit();
                        $(this).closest('td').removeClass($(this).prop('checked') ? 'status_red' : "status_blue");
                        $(this).closest('td').addClass(($(this).prop('checked')) ? 'status_blue' : "status_red");
                        table.row($(this).parents('tr')).invalidate().draw();
                    }
                );
            /*[END checkbox class change section]*/

            // Activate an inline edit on click of a table cell
            // or a DataTables Responsive data cell 
            $('#shipments').on('click', 'tbody td:not(:first-child)', function(e) {
                var colIdx = table.cell(this).index().column;
                var rowData = table.row(this.parentNode).data();
                if (colIdx >= 1 && colIdx < 14) {
                    editor.inline(this, {
                        onBlur: 'submit'
                    });
                }
            });

            new $.fn.dataTable.Buttons(
                table, [
                    /* { extend: "create", editor: editor },*/
                    {
                        extend: "edit",
                        editor: editor
                    },
                    {
                        extend: "remove",
                        editor: editor
                    }
                ]
            );


        });

    }
    (jQuery));