// Setting ng-app and adding table realization
    angular.element(document).ready(function() {
        angular.bootstrap(document, ['UiGridModule', 'UiSourceModule']);      
    });
    
    // Main controller init
    function ctrl($scope,$http) {
        
        var cls = document.getElementsByTagName("input").faculty.value;
        var url = "http://localhost:57772/brs/form/objects/";
        $http.get(url + cls + "/faculties")
        .success(function(data) {
            $scope.faculties = data.children;
            console.log("faculties");
            console.log($scope.faculties);
        }).error(function(data, status) {
           alert("["+status+"]   Ошибка при загрузки пользователей!["+data+"]");
        });
       
        cls = document.getElementsByTagName("input").acadYear.value;
        $http.get(url + cls + "/all")
        .success(function(data) {
            $scope.academicYears = data.children;
            console.log("academicYears");
            console.log($scope.academicYears);
        }).error(function(data, status) {
           alert("["+status+"]   Ошибка при загрузки пользователей!["+data+"]");
        });
       
        cls = document.getElementsByTagName("input").semester.value;
        $http.get(url + cls + "/semesters")
        .success(function(data) {
            $scope.semesters = data.children;
            console.log("semesters");
            console.log($scope.semesters);
        }).error(function(data, status) {
           alert("["+status+"]   Ошибка при загрузки пользователей!["+data+"]");
        });
       
        cls = document.getElementsByTagName("input").deanery.value;
        $http.get(url + cls + "/DW")
        .success(function(data) {
            $scope.deaneryWorkers = data.children;
            console.log("deaneryWorkers");
            console.log($scope.deaneryWorkers);
        }).error(function(data, status) {
           alert("["+status+"]   Ошибка при загрузки пользователей!["+data+"]");
        });
        
        $("#facultyModal input[type='submit']").click(function(){
            var selectedDean = $("button[data-id='deanList'] .filter-option span").attr('title');
            if ($(this).val()=="Изменить"){
                var id = localStorage.getItem("Id");
                }
                var cls = $("input[name='faculty']").val();
                var data = JSON.stringify({
                _class : cls,
                Title : $("#facultyTitle").val(),
                TitleShort : $("#facultyTitleShort").val(),
                Dean : {
                    _class: "Users.Person",
                    _id: selectedDean
                }
            });
            var st = createObject(data, cls, id);
            checkState(st);
        });
        $("#acadYearModal input[type='submit']").click(function(){
            if ($(this).val()=="Изменить"){
                var id = localStorage.getItem("Id");
            }
            var cls = $("input[name='acadYear']").val();
            var $yearStart = Number($("#yearStart").val());
            var $yearEnd = $yearStart + 1;
            var data = JSON.stringify({
                _class : cls,
                YearStart : $yearStart,
                YearEnd : $yearEnd,
                YearTitle : ($yearStart+'/'+$yearEnd).toString()
            });
            var st = createObject(data, cls, id);
            checkState(st);
        });
        $("#semesterModal input[type='submit']").click(function(){
            var selectedYear = $("button[data-id='yearList'] .filter-option span").attr('title');
            console.log(selectedYear);
            if ($(this).val()=="Изменить"){
                var id = localStorage.getItem("Id");
            }
            var cls = $("input[name='semester']").val();
            var data = JSON.stringify({
                _class : cls,
                Title : $("#semesterTitle").val(),
                AcademicYear : {
                    _class: "Data.AcademicYear",
                    _id: selectedYear
                }
            });
            var st = createObject(data, cls, id);
            checkState(st);
        });
    
        // Создание сотрудника деканата из списков
        $("#dWorkerModal input[type='submit']").click(function(){
            var selectedFaculty = $("button[data-id='facultyList'] .filter-option span").attr('title');
            var selectedPerson = $("button[data-id='personList'] .filter-option span").attr('title');
            var cls = $("input[name='deanery']").val();
            if ($(this).val()=="Изменить"){
                var id = localStorage.getItem("Id");
            }
            console.log('create from existing user');
            var data = JSON.stringify({
                _class : cls,
                Faculty : {
                    _class: "Data.Faculty",
                    _id: selectedFaculty
                },
                Person : {
                    _class: "Users.Person",
                    _id: selectedPerson
                }
            });
            var st = createObject(data, cls, id);
            console.log(localStorage.getItem("status"));
            checkState(st);
            
        });
        // Создание нового юзера
        $("#personModal input[type='submit']").click(function(){
            console.log('working with user');
            var pw = $("#personModal .password"),
            pw_confirm = $("#personModal .password-confirm");
            var st = validatePassword(pw, pw_confirm);
            if (st == "1"){
                if ($(this).val()=="Изменить"){
                    var id = localStorage.getItem("Id");
                }
                else{
                    var target = "createSystemUser";
                    var data = JSON.stringify({
                        Class : "Security.Users",
                        Username : $("#personModal #Username").val(),
                        Roles : "DeaneryWorker",
                        Password : pw.val()
                    });
                    // стоит использовать ранее объявленную или локальную переменную? 
                    st = createObject(data, target);
                    console.log('sysUserState: '+st);
                    // статус как 200/500 или 1/0 ? конвертация статуса?
                    if (st=="1"){
                        cls = "Users.Person";
                        data = JSON.stringify({
                            _class: cls,
                            Username: $("#personModal #Username").val(),
                            Name: $("#personModal #Name").val(),
                            Surname: $("#personModal #Surname").val(),
                            Patronymic: $("#personModal #Patronymic").val(),
                            FullName: $("#personModal #Surname").val()+" "+ $("#personModal #Name").val().substr(0,1)+"."+$("#personModal #Patronymic").val().substr(0,1)+"."
                        });
                        st = createObject(data, cls, id);
                        
                    }
                    
                }
            }
            else{
                $('.regMessage').append("<div class='alert alert-danger alert-dismissable'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Пароли не совпадают!</div>");
            }
        });

        function validatePassword(p, pc){
            if(p.val() != pc.val()) {
                p.val(""), pc.val("");
                return 0;
            }
            else return 1;
        }   
        
        function createObject(data, cls, id){
            var url = "http://localhost:57772/brs/form/object/"+cls;
            var method = "POST";
            if (id!=undefined){
                method = "PUT";
                url += "/"+id;
            }
            var result = $.ajax({
                "headers": {
                    "Content-Type": "application/json"
                },
                "method": method,
                "url": url,
                "data": data,
                "processData": false,
                "statusCode": {
                    "500": function(){ localStorage.setItem("status", "0") },
                    "200": function(){ localStorage.setItem("status", "1") }
                }
            });
            console.log(result.status);
            console.log(localStorage.getItem("status"));
            var status = localStorage.getItem("status");
            console.log(status);
            return status;
        }
        
        function checkState(status){
            switch(status){
            case "1":{
                $('.regMessage').append("<div class='alert alert-success alert-dismissable'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+
                        "Готово! Обновите страницу</a></div>");
                break;
            }
            case "0":{
                $('.regMessage').append("<div class='alert alert-danger alert-dismissable'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Ошибка создания или изменения!</div>");
                break;
            }
            default:{ 
                $('.regMessage').append("Неизвестная ошибка");
                break;
            }
            }
        }
        
        $("ul.navbar-nav li").click(function(){
            $(".regMessage").empty();
            $(".delMessage").empty();
        })
    
        // Active rows in table realization. Disabled buttons realization.
        $(".grid").ready(function(){
            // Скрытие первого столбца таблицы?
            $(".grid tbody").on("load", "tr", function(){
                var that = $(this);
                var rowCount = that[0].cells.length;
                console.log('row count:' + rowCount);
            });
            /*
            // Реализация скрытия первого стоблца таблиц с ID объектов
            $.each($(".grid").find("tbody"), function(key,value){
                console.log($(this)[0]);
            });
            */
            $(".grid tbody").on("click", "tr", function(){
                var that = $(this);
                var rowCount = that[0].cells.length;
                // очистка хранилища
                localStorage.clear();
                // захват данных активной строки 
                for(var i = 0;i<rowCount;i++){
                    if (i==0){
                        localStorage.setItem("Id",that[0].cells[i].innerText);
                    }
                    else{
                        localStorage.setItem("item"+i,that[0].cells[i].innerText);
                    }
                }
                console.log(localStorage.getItem('Id'));
    
                var that = $(this);
                that.addClass('active').siblings().removeClass('active');
                
                $(".btn-primary").removeClass('disabled');
                $(".btn-danger").removeClass('disabled');
                $(".nav li").click(function(){
                    that.removeClass('active');
                    $(".btn-primary").addClass('disabled');
                    $(".btn-danger").addClass('disabled');
                });
            });
        
            // Заполнение полей формы при изменении объекта
            $(".btn-primary").click(function (){
                // инпуты названы itemN, где N-число
                var i=1;
                while(localStorage.getItem("item"+i) != null)
                {
                    console.log($(this));
                    //console.log($(".item"+i).tagName);
                    $(".item"+i).val(localStorage.getItem("item"+i));       
                    //if
                    i++;
                }
            })
        });
    
    // ! Под вопросом - критует остальные списки.
        $("#dwModal").ready(function(){
            $("div.dropdown-menu>ul").click(function(){
            console.log('ok');
            if ($("div[ng-show=\"regDW\"]").hasClass("ng-hide")){
                console.log('ok');
                $("button#editPerson").removeClass("ng-hide");
            }
        });
        });
    
        $("button#editPerson").click(function(){
            var personID = $("#dwModal button[data-id=\"personList\"] span span").attr("title");
            var username;
            $.get("http://localhost:57772/brs/form/object/Users.Person/"+personID)
            .done(function(data) {
                username = data.Username;
            })
            .fail();
            $("#resetPWModal input[type=\"submit\"]").click(function(){
                resetPassword(username);
            });
        });
    
        // select'ы
        $("#deanList").ready(function(){
            $.get("http://localhost:57772/brs/form/objects/Users.Person/all")
            .done(function(data) {
                $.each(data.children, function(key,value){
                    $("#deanList").append(
                        "<option data-content='<span title=\""+value.ID+"\">"+value.FullName+"</span>' value=" + value.ID + ">" +
                        + value.FullName + "</option>");
                });
                
            });
            makeSelects($("#deanList"));
        });
        $("#yearList").ready(function(){
            $.get("http://localhost:57772/brs/form/objects/Data.AcademicYear/all")
            .done(function(data) {
                $.each(data.children, function(key,value){
                    $("#yearList").append(
                            "<option data-content='<span title=\""+value.ID+"\">"+value.YearTitle+"</span>' value=" + value.ID + ">" + 
                            + value.YearTitle + "</option>");
                });
            });
            makeSelects($("#yearList"));
        });
        
        $("#facultyList").ready(function(){
            $.get("http://localhost:57772/brs/form/objects/Data.Faculty/all")
            .done(function(data) {
                $.each(data.children, function(key,value){
                    $("#facultyList").append(
                    "<option data-content='<span title=\""+value.ID+"\">"+value.Title+"</span>' value=" + value.ID + ">" + value.Title + "</option>"
                    );
                });
            });
            makeSelects($("#facultyList"));
        });
        
        $("#personList").ready(function(){
            $.get("http://localhost:57772/brs/form/objects/Users.Person/all")
            .done(function(data) {
                $.each(data.children, function(key,value){
                    $("#personList").append(
                    "<option data-content='<span title=\""+value.ID+"\">"+value.FullName+"</span>' value=" + value.ID + ">" + value.FullName + "</option>"
                    );
                });
            });
            makeSelects($("#personList"));
        });
        
        function makeSelects($select){
            setTimeout(function() {
                $('.selectpicker').selectpicker('refresh');
            }, 1000 );  
        }
            
        // Удаление записей
        $("#deleteFaculty").click(function(){
            var id = localStorage.getItem("Id");
            var cls = $("input[name='faculty']").val();
            $("#deleteID").val(id);
            $("#deleteClass").val(cls);
            $("#deleteModal").modal('show');
        })
        $("#deleteAcadYear").click(function(){
            var id = localStorage.getItem("Id");
            var cls = $("input[name='acadYear']").val();
            $("#deleteID").val(id);
            $("#deleteClass").val(cls);
            $("#deleteModal").modal('show');
        })
        $("#deleteSemester").click(function(){
            var id = localStorage.getItem("Id");
            var cls = $("input[name='semester']").val();
            $("#deleteID").val(id);
            $("#deleteClass").val(cls);
            $("#deleteModal").modal('show');
        })
        $("#deleteDW").click(function(){
            var id = localStorage.getItem("Id");
            var cls = $("input[name='deanery']").val();
            $("#deleteID").val(id);
            $("#deleteClass").val(cls);
            $("#deleteModal").modal('show');
        })
    } // End of ctrl
    
    // Очистка формы после закрытия модального окна
    function clearForm(){
        var i = 1;
        while ($(".item"+i).length!=0)
        {
            $(".item"+i).val('');
            i++;
        }
        $('.regMessage').empty();
    }
    
    function resetPassword(username){ 
        var url = "http://localhost:57772/brs/form/object/editSystemUser/"+username;
        var data = { "Class" : "Security.Users", "resetPassword": 1 }; 
        $.ajax({
            "headers": {
                "Content-Type": "application/json"
            },
            "method": "PUT",
            "url": url,
            "data": JSON.stringify(data),
            "statusCode": {
                "200": function(data) {
                    $('.delMessage').append("<div class='alert alert-success alert-dismissable'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+
                        "Пароль сброшен! Временный пароль для пользователя "+ username +": "+data.Password+"<br>"+
                        "Обязательно запишите его!");
                    $("#resetPWModal").modal('hide');
                },
                "500": function(){
                    $('.delMessage').append("<div class='alert alert-danger alert-dismissable'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Ошибка сброса пароля!</div>");
                    $("#resetPWModal").modal('hide');
                }
            }
        })
    }

    function deleteObject(id, className){
        var url = "http://localhost:57772/brs/form/object/"+className+"/"+id;
        var data = { _class : className }; 
        $.ajax({
            "headers": {
                "Content-Type": "application/json"
            },
            "method": "DELETE",
            "url": url,
            "data": JSON.stringify(data),
            "statusCode": {
                "200": function() {
                    $('.delMessage').append("<div class='alert alert-success alert-dismissable'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+
                        "Запись удалена! Обновите страницу</div>");
                    $("#deleteModal").modal('hide');
                },
                "500": function(){
                    $('.delMessage').append("<div class='alert alert-danger alert-dismissable'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Ошибка удаления записи!</div>");
                    $("#deleteModal").modal('hide');
                }
            }
        })
    }
    
    // getting data of logged user. 03.04 'contains' вместо 'eq' - костыль, ибо с eq перестал находить username. 
    var $thisUser = $(".user-info h5 span").text();
    $.ajax({
        "headers": {
            "Content-Type": "application/json"
        },
        "method": "GET",
        "url": "http://localhost:57772/brs/form/objects/Users.Person/all?filter=Username contains "+$thisUser,
        "statusCode": {
            "200": function(data) {
                console.log(data.children);
                var thisUser = data.children[0];
                $(".user-info h5+span").append(thisUser.Surname," ",thisUser.Name," ",thisUser.Patronymic);
            },
            "500": function(){
                console.log("data load failed!");
            }
        }
    })
    