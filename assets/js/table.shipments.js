(function($){

    $(document).ready(function() {
        /*       var simple_checkbox = function ( data, type, full, meta ) {
                   var is_checked = data === "TRUE" ? "checked" : "";
                   return '<input type="checkbox" class="checkbox" ' +
                       is_checked + ' />';
               }
       */
        var editor = new $.fn.dataTable.Editor( {
            ajax: '/Ajax/Shipments',
            table: '#shipments',
            fields:
                [   {
                        label: "Status:",
                        name: "shipments.status",
                        type: "readonly"
                    },
                    {
                        label: "PO:",
                        name: "shipments.po"
                    },
                    {
                        label: "Product:",
                        name: "shipments.product_id",
                        type: "select",
                        placeholder: "" 
                    },
                    {
                        label: "CN:",
                        name: "shipments.container_number",
                        type: "readonly"
                    },
                    {
                        label: "B/L:",
                        name: "shipments.bill_of_lading",
                        type: "readonly"
                    },
                    {
                        label: "Vendor:",
                        name: "shipments.vendor_id",
                        type: "select",
                        placeholder: ""
                    },
                    {
                        label: "Port:",
                        name: "shipments.discharge_port",
                        type: "readonly"
                    },
                    {
                        label: "Dest.:",
                        name: "shipments.final_destination",
                        type: "readonly"
                    },
                    {
                        label: "ETA:",
                        name: "shipments.eta",
                        type: "date",
                        format:    'YYYY-MM-DD'
                    },
                    {
                        label: "LFD:",
                        name: "shipments.lfd",
                        type: "date",
                        format:    'YYYY-MM-DD'
                    },
                    {
                        label: "Pickup Number:",
                        name: "shipments.pickup_number"
                    },
                    {
                        label: "Truck Date:",
                        name: "shipments.truck_date",
                        type: "datetime",
                        format:    'MM-DD-YYYY h:mm A'
                    },
                    {
                        label: "Truck Co.:",
                        name: "shipments.trucker_id",
                        type: "select",
                        placeholder: "" 
                    },{
                        label: "Container Size:",
                        name: "shipments.container_size",
                        type: "readonly"
                    },
                    {
                        label: "B/L Status:",
                        name: "shipments.bl_status",
                        type: "readonly"
                    },
                    {
                        label: "Freight:",
                        name: "shipments.freight",
                        type: "checkbox",
                        options: [
                            { label: "", value: 1 }
                        ],
                        separator: '',
                        unselectedValue: 0
                    },
                    {
                        label: "ISF:",
                        name: "shipments.isf_required",
                        type: "checkbox",
                        options: [
                            { label: "", value: 1 }
                        ],
                        separator: '',
                        unselectedValue: 0
                    },
                    {
                        label: "Customs:",
                        name: "shipments.customs",
                        type: "checkbox",
                        options: [
                            { label: "", value: 1 }
                        ],
                        separator: '',
                        unselectedValue: 0
                    },
                    {
                        label: "QB RT:",
                        name: "shipments.qb_rt",
                        type: "checkbox",
                        options: [
                            { label: "", value: 1 }
                        ],
                        separator: '',
                        unselectedValue: 0
                    },
                    {
                        label: "QB WS:",
                        name: "shipments.qb_ws",
                        type: "checkbox",
                        options: [
                            { label: "", value: 1 }
                        ],
                        separator: '',
                        unselectedValue: 0
                    },
                    {
                        label: "Requires Payment?:",
                        name: "shipments.requires_payment",
                        type: "checkbox",
                        options: [
                            { label: "", value: 1 }
                        ],
                        separator: '',
                        unselectedValue: 0
                    }
                ]
        } );

        var table = $('#shipments').DataTable( {
            ajax: '/Ajax/Shipments',
            //responsive: 'true',
            columnDefs: [{
                "defaultContent": " ",
                "targets": "_all"
            }],
            select: {
                style: 'true'
            },
            columns:
                [   /*{   // Responsive control column
                        data: null,
                        defaultContent: '',
                        className: 'control',
                        orderable: false
                    },*/
                    {   // Checkbox select column
                        data: null,
                        defaultContent: '',
                        className: 'select-checkbox',
                        orderable: false
                    },
                    {
                        data: "shipments.status"
                    },
                    {data: "shipments.po"},
                    {data: "products.product_name", editField: "shipments.product_id"},
                    {data: "shipments.container_number"},
                    {data: "shipments.bill_of_lading"},
                    {data: "vendors.abbreviation", editField: "shipments.vendor_id"},
                    {data: "shipments.discharge_port"},
                    {data: "shipments.final_destination"},
                    {
                        data: "shipments.eta"/*,
                        render: 
                            function (data) {
                                var date = new Date(data);
                                var month = date.getMonth() + 1;
                                return (month.length > 1 ? month : "0" + month) + "/" + date.getDate() + "/" + date.getFullYear();
                            }*/
                    },
                    {
                        data: "shipments.lfd",
                       /* render: 
                            function (data) {
                                var date = new Date(data);
                                var month = date.getMonth() + 1;
                                return (month.length > 1 ? month : "0" + month) + "/" + date.getDate() + "/" + date.getFullYear();
                            }*/
                    },
                    {data: "shipments.pickup_number"},
                    {
                        data: "shipments.truck_date"/*,
                        render: 
                            function (data) {
                                var date = new Date(data);
                                var month = date.getMonth() + 1;
                                return (month.length > 1 ? month : "0" + month) + "/" + date.getDate() + "/" + date.getFullYear();
                            }*/
                    },
                    {data: "truckers.trucker_name", editField: "shipments.trucker_id"},
                    {data: "shipments.container_size"},
                    {data: "shipments.bl_status"},
                    {
                        data: "shipments.freight",
                        render: function ( data, type, row ) {
                            if ( type === 'display' ) {
                                return '<input type="checkbox" id="editor-freight" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "shipments.isf_required",
                        render: function ( data, type, row ) {
                            if ( type === 'display' ) {
                                return '<input type="checkbox" id="editor-isfrequired" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    /*{
                         data: "shipments.isf_required",
                         render: simple_checkbox
                     },*/
                    {
                        data: "shipments.customs",
                        render: function ( data, type, row ) {
                            if ( type === 'display' ) {
                                return '<input type="checkbox" id="editor-customs" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "shipments.qb_rt",
                        render: function ( data, type, row ) {
                            if ( type === 'display' ) {
                                return '<input type="checkbox" id="editor-qb_rt" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    {
                        data: "shipments.qb_ws",
                        render: function ( data, type, row ) {
                            if ( type === 'display' ) {
                                return '<input type="checkbox" id="editor-qb_ws" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
                    /*{data: "shipments.latest_event"},
                    {data: "shipments.latest_event_time_and_date"},*/
                    {
                        data: "shipments.requires_payment",
                        render: function ( data, type, row ) {
                            if ( type === 'display' ) {
                                return '<input type="checkbox" id="editor-requires_payment" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    }
                ],
            order: [[ 9, 'asc' ], [ 6, 'asc' ], [2, 'asc']],
            /*createdRow:
                function( row, data, index ) {
                    if (data.
                },*/
            rowCallback: 
                function ( row, data ) {
                    // Set the checked state of the checkbox in the table
                    //alert("data: "+data.toString());
                    if (data.shipments.eta==='1970-01-01'){
                        data.shipments.eta='';
                       // alert(data.shipments.eta);
                    }
                    $('#editor-freight', row).prop( 'checked', data.shipments.freight == 1 );
                    $('#editor-isfrequired', row).prop( 'checked', data.shipments.isf_required == 1 );
                    $('#editor-customs', row).prop( 'checked', data.shipments.customs == 1 );
                    $('#editor-qb_rt', row).prop( 'checked', data.shipments.qb_rt == 1 );
                    $('#editor-qb_ws', row).prop( 'checked', data.shipments.qb_ws == 1 );
                    $('#editor-requires_payment', row).prop( 'checked', data.shipments.requires_payment == 1 );
                    if (data.shipments.freight == 1){
                        $("td:nth-child(17)", row).addClass("status_blue");
                        $("td:nth-child(17)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(17)", row).removeClass("status_blue");
                        $("td:nth-child(17)", row).addClass("status_red");
                    }
                    if (data.shipments.isf_required == 1){
                        $("td:nth-child(18)", row).addClass("status_blue");
                        $("td:nth-child(18)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(18)", row).removeClass("status_blue");
                        $("td:nth-child(18)", row).addClass("status_red");
                    }
                    if (data.shipments.customs == 1){
                        $("td:nth-child(19)", row).addClass("status_blue");
                        $("td:nth-child(19)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(19)", row).removeClass("status_blue");
                        $("td:nth-child(19)", row).addClass("status_red");
                    }
                    if (data.shipments.qb_rt == 1){
                        $("td:nth-child(20)", row).addClass("status_blue");
                        $("td:nth-child(20)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(20)", row).removeClass("status_blue");
                        $("td:nth-child(20)", row).addClass("status_red");
                    }
                    if (data.shipments.qb_ws == 1){
                        $("td:nth-child(21)", row).addClass("status_blue");
                        $("td:nth-child(21)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(21)", row).removeClass("status_blue");
                        $("td:nth-child(21)", row).addClass("status_red");
                    }
                    if (data.shipments.requires_payment == 1){
                        $("td:nth-child(22)", row).addClass("status_blue");
                        $("td:nth-child(22)", row).removeClass("status_red");
                    } else {
                        $("td:nth-child(22)", row).removeClass("status_blue");
                        $("td:nth-child(22)", row).addClass("status_red");
                    }
                   /* var columnIndex;
                    var colCount = data.length;
                    for (columnIndex = 14; columnIndex < colCount; i++) { 
                        if ( data[columnIndex] == 1 ) {
                            $('td', row).eq(columnIndex).addClass('status_blue');
                            $('td', row).eq(columnIndex).removeClass('status_yellow');
                            $('td', row).eq(columnIndex).removeClass('status_red');
                        } else {
                            $('td', row).eq(columnIndex).addClass('status_red');
                            $('td', row).eq(columnIndex).removeClass('status_yellow');
                            $('td', row).eq(columnIndex).removeClass('status_blue');
                        }
                    }*/
                }
            });

        
        
            $('#shipments')
            .on( 'change', '#editor-freight', 
                function () {
                    editor.edit( $(this).closest('tr'), false, {submit: 'changed'} )
                        .set( 'shipments.freight', $(this).prop( 'checked' ) ? 1 : 0 )
                        .submit();
                        $(this).closest('td').removeClass($(this).prop( 'checked' ) ? 'status_red' : "status_blue" );
                        $(this).closest('td').addClass( ($(this).prop( 'checked' )) ? 'status_blue' : "status_red" );
                }
            )
            .on( 'change', '#editor-isfrequired', 
                function () {
                    editor.edit( $(this).closest('tr'), false, {submit: 'changed'} )
                        .set( 'shipments.isf_required', $(this).prop( 'checked' ) ? 1 : 0 )
                        .submit();
                        $(this).closest('td').removeClass($(this).prop( 'checked' ) ? 'status_red' : "status_blue" );
                        $(this).closest('td').addClass( ($(this).prop( 'checked' )) ? 'status_blue' : "status_red" );
                }
            )
            .on( 'change', '#editor-customs', 
                function () {
                    editor.edit( $(this).closest('tr'), false, {submit: 'changed'} )
                        .set( 'shipments.customs', $(this).prop( 'checked' ) ? 1 : 0 )
                        .submit();
                        $(this).closest('td').removeClass($(this).prop( 'checked' ) ? 'status_red' : "status_blue" );
                        $(this).closest('td').addClass( ($(this).prop( 'checked' )) ? 'status_blue' : "status_red" );
                }
            )
            .on( 'change', '#editor-qb_rt', 
                function () {
                    editor.edit( $(this).closest('tr'), false, {submit: 'changed'} )
                        .set( 'shipments.qb_rt', $(this).prop( 'checked' ) ? 1 : 0 )
                        .submit();
                        $(this).closest('td').removeClass($(this).prop( 'checked' ) ? 'status_red' : "status_blue" );
                        $(this).closest('td').addClass( ($(this).prop( 'checked' )) ? 'status_blue' : "status_red" );
                }
            )
            .on( 'change', '#editor-qb_ws',
                function () {
                    editor.edit( $(this).closest('tr'), false, {submit: 'changed'} )
                        .set( 'shipments.qb_ws', $(this).prop( 'checked' ) ? 1 : 0 )
                        .submit();
                        $(this).closest('td').removeClass($(this).prop( 'checked' ) ? 'status_red' : "status_blue" );
                        $(this).closest('td').addClass( ($(this).prop( 'checked' )) ? 'status_blue' : "status_red" );
                }
            )
            .on( 'change', '#editor-requires_payment', 
                function () {
                    editor.edit( $(this).closest('tr'), false, {submit: 'changed'} )
                        .set( 'shipments.requires_payment', $(this).prop( 'checked' ) ? 1 : 0 )
                        .submit();
                        $(this).closest('td').removeClass($(this).prop( 'checked' ) ? 'status_red' : "status_blue" );
                        $(this).closest('td').addClass( ($(this).prop( 'checked' )) ? 'status_blue' : "status_red" );
                }
            )
        ;
        
        
        // Activate an inline edit on click of a table cell
        // or a DataTables Responsive data cell 
        $('#shipments').on( 'click', 'tbody td:not(:first-child)', function (e) {
                var colIdx = table.cell(this).index().column;
                if ( colIdx <15 ) {
                    editor.inline(this, {
                        onBlur: 'submit'
                    });
                }
                /*  $("#shipments tbody tr").removeClass('selected');		
                     $(this).addClass('selected');*/
        });

        /* $('#shipments tbody')
            .on('mouseenter','tr', function(){
                if ( !$(this).hasClass('highlight') ) {
                    $(this).addClass('highlight');
                }
            })
            .on('mouseleave','tr', function(){
                if ($(this).hasClass('highlight') ) {
                    $(this).removeClass('highlight');
                }
            });

               $('#shipments tbody')
                    .on( 'click', 'td', function () {
                        var colIdx = table.cell(this).index().column;
                        if ( colIdx <15  ) {
                       /*     $( table.cells().nodes() ).removeClass( 'highlight' );
                            $( table.column( colIdx ).nodes() ).addClass( 'highlight' );

                }
            });
            .on( 'mouseleave', function () {
                $( table.cells().nodes() ).removeClass( 'highlight' );
            } );*/


        new $.fn.dataTable.Buttons(
            table,
            [
               /* { extend: "create", editor: editor },*/
                { extend: "edit",   editor: editor },
                { extend: "remove", editor: editor }
            ]
        );

        table.buttons().container()
            .appendTo( $('.col-md-6:eq(0)', table.table().container() ) );
    } );

    }(jQuery));
