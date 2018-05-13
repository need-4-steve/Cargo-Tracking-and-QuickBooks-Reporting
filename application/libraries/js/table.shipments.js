(function($){

    $(document).ready(function() {
        /*       var simple_checkbox = function ( data, type, full, meta ) {
                   var is_checked = data === "TRUE" ? "checked" : "";
                   return '<input type="checkbox" class="checkbox" ' +
                       is_checked + ' />';
               }
       */
        var editor = new $.fn.dataTable.Editor( {
            ajax: 'Ajax/Shipments',
            table: '#shipments',
            fields:
                [   {
                    label: "Status:",
                    name: "shipments.status"
                },
                    {
                        label: "PO:",
                        name: "shipments.po"
                    },
                    {
                        label: "Product ID:",
                        name: "shipments.product_id",
                        type: "select"
                    },
                    {
                        label: "Container Number:",
                        name: "shipments.container_number",
                        type: "readonly"
                    },
                    {
                        label: "Bill of Lading:",
                        name: "shipments.bill_of_lading",
                        type: "readonly"
                    },
                    {
                        label: "Vendor Name:",
                        name: "shipments.vendor_id",
                        type: "select"
                    },
                    {
                        label: "Discharge Port:",
                        name: "shipments.discharge_port"
                    },
                    {
                        label: "Final Destination:",
                        name: "shipments.final_destination"
                    },
                    {
                        label: "ETA:",
                        name: "shipments.eta",
                        type: "datetime",
                        format: "YYYY-MM-DD HH:mm:ss"
                    },
                    {
                        label: "LFD:",
                        name: "shipments.lfd",
                        type: "datetime",
                        format: "DD-MM-YY"
                    },
                    {
                        label: "Pickup Number:",
                        name: "shipments.pickup_number"
                    },
                    {
                        label: "Truck Date:",
                        name: "shipments.truck_date",
                        type: "datetime",
                        format: "ddd, D MMM YY"
                    },
                    {
                        label: "Trucker Name:",
                        name: "shipments.trucker_id",
                        type: "select"
                    },
                    {
                        label: "BL Status:",
                        name: "shipments.bl_status"
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
                        label: "ISF Required?:",
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
                    /*    {
                            label: "Latest Event:",
                            name: "shipments.latest_event"
                        },
                        {
                            label: "Latest Event Time and Date:",
                            name: "shipments.latest_event_time_and_date",
                            type: "datetime",
                            format: "YYYY-MM-DD HH:mm:ss"
                        },*/
                    {
                        label: "Is Active?:",
                        name: "shipments.is_active",
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
            ajax: 'Ajax/Shipments',
            //responsive: 'true',
            columnDefs: [{
                "defaultContent": " ",
                "targets": "_all"
            }],
            select: {
                style: 'single'
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
                    {data: "shipments.status"},
                    {data: "shipments.po"},
                    {data: "products.product_name", editField: "shipments.product_id"},
                    {data: "shipments.container_number"},
                    {data: "shipments.bill_of_lading"},
                    {data: "vendors.abbreviation", editField: "shipments.vendor_id"},
                    {data: "shipments.discharge_port"},
                    {data: "shipments.final_destination"},
                    {data: "shipments.eta"},
                    {data: "shipments.lfd"},
                    {data: "shipments.pickup_number"},
                    {data: "shipments.truck_date"},
                    {data: "truckers.trucker_name", editField: "shipments.trucker_id"},
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
                        data: "shipments.is_active",
                        render: function ( data, type, row ) {
                            if ( type === 'display' ) {
                                return '<input type="checkbox" id="editor-is_active" class="rowCB">';
                            }
                            return data;
                        },
                        className: "dt-body-center"
                    },
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
            rowCallback: function ( row, data ) {
                // Set the checked state of the checkbox in the table
                //alert("data: "+data.toString());
                $('#editor-freight', row).prop( 'checked', data.shipments.freight == 1 );
                $('#editor-isfrequired', row).prop( 'checked', data.shipments.isf_required == 1 );
                $('#editor-customs', row).prop( 'checked', data.shipments.customs == 1 );
                $('#editor-qb_rt', row).prop( 'checked', data.shipments.qb_rt == 1 );
                $('#editor-qb_ws', row).prop( 'checked', data.shipments.qb_ws == 1 );
                $('#editor-is_active', row).prop( 'checked', data.shipments.is_active == 1 );
                $('#editor-requires_payment', row).prop( 'checked', data.shipments.requires_payment == 1 );
            }
        } );
        $('#shipments')
            .on( 'change', '#editor-freight', function () {
                /* editor.edit( $(this).closest('tr'), false )
                       .set( 'shipments.freight', $(this).prop( 'checked' ) ? 1 : 0 )
                       .submit();*/
                editor.edit( $(this).closest('tr'), false, {
                    submit: 'changed'
                } )
                    .set( 'shipments.freight', $(this).prop( 'checked' ) ? 1 : 0 )
                    .submit();
                alert(this.className.toString());
            })
            .on( 'change', '#editor-isfrequired', function () {
                /*editor.edit( $(this).closest('tr'), false )
                      .set( 'shipments.isf_required', $(this).prop( 'checked' ) ? 1 : 0 )
                      .submit();*/
                editor.edit( $(this).closest('tr'), false, {
                    submit: 'changed'
                } )
                    .set( 'shipments.isf_required', $(this).prop( 'checked' ) ? 1 : 0 )
                    .submit();
            })
            .on( 'change', '#editor-customs', function () {
                /*editor.edit( $(this).closest('tr'), false )
                      .set( 'shipments.customs', $(this).prop( 'checked' ) ? 1 : 0 )
                      .submit();*/
                editor.edit( $(this).closest('tr'), false, {
                    submit: 'changed'
                } )
                    .set( 'shipments.customs', $(this).prop( 'checked' ) ? 1 : 0 )
                    .submit();
            })
            .on( 'change', '#editor-qb_rt', function () {
                /* editor.edit( $(this).closest('tr'), false )
                       .set( 'shipments.qb_rt', $(this).prop( 'checked' ) ? 1 : 0 )
                       .submit();*/
                editor.edit( $(this).closest('tr'), false, {
                    submit: 'changed'
                } )
                    .set( 'shipments.qb_rt', $(this).prop( 'checked' ) ? 1 : 0 )
                    .submit();
            })
            .on( 'change', '#editor-qb_ws', function () {
                /* editor.edit( $(this).closest('tr'), false )
                        .set( 'shipments.qb_ws', $(this).prop( 'checked' ) ? 1 : 0 )
                        .submit();*/
                editor.edit( $(this).closest('tr'), false, {
                    submit: 'changed'
                } )
                    .set( 'shipments.qb_ws', $(this).prop( 'checked' ) ? 1 : 0 )
                    .submit();
            })
            .on( 'change', '#editor-is_active', function () {
                /*editor.edit( $(this).closest('tr'), false )
                       .set( 'shipments.is_active', $(this).prop( 'checked' ) ? 1 : 0 )
                       .submit();*/
                editor.edit( $(this).closest('tr'), false, {
                    submit: 'changed'
                } )
                    .set( 'shipments.is_active', $(this).prop( 'checked' ) ? 1 : 0 )
                    .submit();
            })
            .on( 'change', '#editor-requires_payment', function () {
                /* editor.edit( $(this).closest('tr'), false )
                       .set( 'shipments.requires_payment', $(this).prop( 'checked' ) ? 1 : 0 )
                       .submit();*/
                editor.edit( $(this).closest('tr'), false, {
                    submit: 'changed'
                } )
                    .set( 'shipments.requires_payment', $(this).prop( 'checked' ) ? 1 : 0 )
                    .submit();
            });
        // Activate an inline edit on click of a table cell
        // or a DataTables Responsive data cell
        $('#shipments').on( 'click', 'tbody td:not(:first-child)', function (e) {
            var colIdx = table.cell(this).index().column;
            if ( colIdx <15 ) {
                editor.inline(this, {
                    onBlur: 'submit'
                });
            }
        } );

        $('#shipments tbody')
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

        /*        $('#shipments tbody')
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
                { extend: "create", editor: editor },
                { extend: "edit",   editor: editor },
                { extend: "remove", editor: editor }
            ]
        );

        table.buttons().container()
            .appendTo( $('.col-md-6:eq(0)', table.table().container() ) );
    } );

}(jQuery));