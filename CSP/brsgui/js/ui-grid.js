angular.module("UiGridModule", [])
    .directive('uiGrid', function () {
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            template:
                '<div>' +
                    '<div ng-transclude></div>' +
                    '<table ui-grid-cellNav ui-grid-pinning class="table table-hover table-striped table-bordered grid">' +
                        '<thead><tr>' +
                            '<th ng-repeat="column in columns"' +
                                'ng-class="{sortable: column.sortable}"' +
                                'ng-click="sortBy(column)"' +
                            '>' +
                                '{{column.title}} <i ng-class="getSortDir(column)"></i>' +
                            '</th>' + 
                        '</tr></thead>' +
                        '<tbody>' +
                        '<tr ng-repeat="row in rows | orderBy:sortColumn:reverse">' +
                            '<td ng-repeat="column in columns">' +
                                '{{row[column.name]}}' +
                            '</td>' +
                        '</tr>' +
                        '</tbody>' +
                     '</table>' +
                '</div>',
            scope: {
                rows: '=source'
            },
            controller: function($scope) {
                var columns = $scope.columns = [];

                this.addColumn = function(column){
                    columns.push(column);
                };

                $scope.sortBy = function(column) {
                    if (!column.sortable) return;

                    if ($scope.sortColumn == column.name) {
                        $scope.reverse = !$scope.reverse;
                    } else {
                        $scope.sortColumn = column.name;
                        $scope.reverse = false;
                    }
                };

                $scope.getSortDir = function(column) {
                    if ($scope.sortColumn == column.name) {
                        return $scope.reverse ? 'desc' : 'asc';
                    }
                };
            }
        };
    })
    .directive('column', function() {
        return {
            restrict: 'EA',
            require: '^uiGrid',
            link: function (scope, element, attrs, uiGridCtrl) {
                uiGridCtrl.addColumn({
	                name: attrs.name,
                    title: attrs.title,
                    sortable: scope.$eval(attrs.sortable)
                });
            }
        };
    });