<html>
<head>
    <title>Getting Started with jQuery Grid</title>
    <meta charset="utf-8" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css" />
    <link href="http://code.gijgo.com/1.5.0/css/gijgo.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://code.gijgo.com/1.5.0/js/gijgo.js" type="text/javascript"></script>
</head>
<body>
    <table id="grid"></table>
    <script type="text/javascript">
        $(document).ready(function () {
            var grid = $('#grid').grid({
                dataSource: '/retrieveProducts',
                columns: [
                    { field: 'code', width: 56 },
                    { field: 'description', sortable: true },
//                     { field: 'PlaceOfBirth', title: 'Place Of Birth', sortable: true },
//                     { field: 'DateOfBirth', title: 'Date Of Birth', type: 'date', width: 150 }
                ],
                pager: { limit: 5 }
            });
        });
    </script>
</body>
</html>