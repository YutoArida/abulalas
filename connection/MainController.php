<?php 
 use Phppot\DataSource;
 use PhpOffice\PhpSpreadsheet\Reader\Xlsx;
include('connection/LoginSession.php');
require_once "connection/ApiController.php";
$portCont = new portalController();



$userSession = $portCont->getUserDetails($session_id);

if($userSession[0]['designation'] == 3){
$uid = $userSession[0]['uid'];
$info = $portCont->getStudentDetails($uid);
$ActiveSchoolYear = $portCont->checkTheActiveSchoolYear();
$apiUrl = 'https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl=' . urlencode($uid);
}

if($userSession[0]['designation'] == 2){
    $uid = $userSession[0]['uid'];
$tinfo = $portCont->myTeacherInformation($uid);
}

if(!empty($_GET['mid']))
{
    $mid = $_GET['mid'];
    $mapSpecificCall = $portCont->genMap($mid);
}

$email = $userSession[0]['email'];
$position = strpos($email, '@');
// Extract the substring before '@'
$filteredEmail = substr($email, 0, $position);
// Convert to uppercase
$filteredEmail = strtoupper($filteredEmail);

$activatedSy = $portCont->activatedSyCode();
$studStat = $portCont->checkTotalStudentForTheActivatedSY();
$teacherStat = $portCont->checkTotalTeacherForTheActivatedSY();

if (! empty($_GET["action"])) {
    switch ($_GET["action"]) {
        case "security":
            if(isset($_POST['validate'])){
                $uid = $userSession[0]['uid'];
                $code = $_POST['code'];
                if(!empty($code)){
                   $checkSecurityValidation = $portCont->validateSecurity($code, $uid);
                   if(!empty($checkSecurityValidation)){
                       $portCont->updateSecurity($code, $uid);
                       header('Location: security.php?view=security&message=success');
                   }else{
                       header('Location: security.php?view=security&message=error');
                   }
                }else{
                       header('Location: security.php?view=security&message=error');
                }
            }
        break;

        case "generateSecurity":
            if(isset($_POST['generate'])){
                $email = $userSession[0]['email'];
                $uid = $userSession[0]['uid'];
                $code = rand(6666,9999);
                if(!empty($email) && !empty($uid) && !empty($code)){
                    $portCont->generatedMailValidation($email, $uid, $code);
                    require "api/mailler/securitymail.php";
                    header('Location: security.php?view=security&message=newcode');
                }else{
                    header('Location: security.php?view=security&message=error');
                }
               
            }
        break;

        case "schoolyear":
            if(isset($_POST['add'])){
                $year_from = $_POST['year_from'];
                $year_to = $_POST['year_to'];
                $sycode = rand(6666,9999);
                if(!empty($year_from) && !empty($year_to) && !empty($sycode)){
                    $portCont->addSchoolYear($year_from, $year_to, $sycode);
                    header('Location: home.php?view=schoolyear&message=success');
                }else{
                    header('Location: home.php?view=schoolyear&message=error');
                }
            }
            break;

        case "school_year_detail_grade":
            if(isset($_POST['add'])){
                 $sycode =  $_POST['sycode'];
                 $grade = $_POST['grade'];
                 if(!empty($sycode) && !empty($grade))
                 {
                    $portCont->addGradeSchoolYear($sycode, $grade);
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=success');
                 }else{
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=error');
                 }
            }
            break;

        case "updateGrade":
            if(isset($_POST['update'])){
                $sycode =  $_POST['sycode'];
                $gid = $_POST['gid'];
                $grade = $_POST['grade'];

                if(!empty($sycode) && !empty($gid) && !empty($grade))
                {
                    $portCont->updateGradeSchoolYearDetails($sycode, $gid, $grade);
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=success');
                }else{
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=error');
                }
            }

        case "school_year_detail_section":
            if(isset($_POST['add'])){
                $sycode =  $_POST['sycode'];
                $gid = $_POST['gid'];
                $section_name = $_POST['section_name']; 
                $min = $_POST['min']; 
                $max = $_POST['max'];
                $student_max = $_POST['student_max'];

                if(!empty($sycode) && !empty($gid) && !empty($section_name) && !empty($min) && !empty($max) && !empty($student_max))
                {
                    $portCont->addSectionSchoolYear($sycode, $gid, $section_name, $min, $max, $student_max);
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=success');
                }else{
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=error');
                }
            }
            break;
        
        case "school_year_detail_room":
            if(isset($_POST['add'])){
                $sycode =  $_POST['sycode'];
                $sid =  $_POST['sid'];
                $rid =  $_POST['rid'];
                if(!empty($sycode) && !empty($sid) && !empty($rid)){
                    $portCont->updateSectionSchoolYear($sycode, $sid, $rid);
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=success');
                }else{
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=error');
                }

            }
            break;

        case "school_year_information":
            if(isset($_POST['update'])){
                $sycode = $_POST['sycode'];
                $sid =  $_POST['sid'];
                $section_name = $_POST['section_name']; 
                $min = $_POST['min']; 
                $max = $_POST['max'];
                $student_max = $_POST['student_max'];

                if(!empty($sycode) && !empty($sid) && !empty($section_name) && !empty($min) && !empty($max) && !empty($student_max))
                {
                    $portCont->updateSectionInformationSchoolYear($sid, $section_name, $min, $max, $student_max);
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=success');
                }else{
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=error');
                }
            }
            break;


        case "updateGradeRoom":
            if(isset($_POST['update'])){
                $sycode = $_POST['sycode']; 
                $sid = $_POST['sid'];
                $rid = $_POST['rid'];
                $gid = $_POST['gid']; 

                if(!empty($sycode) && !empty($sid) && !empty($rid) && !empty($gid)){
                    $portCont->updateGradeRoomInformtionSchoolYear($sid, $sycode, $rid, $gid);
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=success');
                }else{
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=error');
                }
            }
            break;

        case "school_year_activation":
            if(isset($_POST['activate'])){
                $sycode = $_POST['sycode'];
                if(!empty($sycode)){
                    $portCont->schoolYearActivation($sycode);
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=success');
                }else{
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=error');
                }
            }
            break;

        case "school_year_deactivation":
            if(isset($_POST['activate'])){
                $sycode = $_POST['sycode'];
                if(!empty($sycode)){
                    $portCont->schoolYearDeActivation($sycode);
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=success');
                }else{
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=error');
                }
            }
            break;

        case "school_year_reactivation":
            if(isset($_POST['activate'])){
                $sycode = $_POST['sycode'];
                if(!empty($sycode)){
                    $portCont->schoolYearReActivation($sycode);
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=success');
                }else{
                    header('Location: home.php?view=school_year_detail&sycode='.$sycode.'&message=error');
                }
            }
            break;


        case "enrollnewstudent":
            if(isset($_POST['add'])){
                $sycode = $_POST['sycode'];
                $email = $_POST['email'];
                $fname = $_POST['fname'];
                $mname = $_POST['mname'];
                $lname = $_POST['lname'];
                $average = $_POST['average'];
                $street = $_POST['street'];
                $gender = $_POST['gender'];
                $region_text = $_POST['region_text'];
                $province_text = $_POST['province_text'];
                $city_text = $_POST['city_text'];
                $barangay_text = $_POST['barangay_text'];

                if(!empty($sycode) && !empty($email) && !empty($fname) && !empty($mname) && !empty($lname) && !empty($average) && !empty($street) && !empty($gender) && !empty($region_text) && !empty($province_text) && !empty($city_text) && !empty($barangay_text))
                {
                    $portCont->newSchoolEnrolleee($sycode, $email, $fname, $mname, $lname, $average, $street, $gender, $region_text, $province_text, $city_text, $barangay_text); 
                    header('Location: home.php?view=enrollment&message=success');    
                }else{
                    header('Location: home.php?view=enrollment&message=error');
                }
            }
            break;

            case "enrolltrans":
                if(isset($_POST['add'])){
                    $sycode = $_POST['sycode'];
                    $email = $_POST['email'];
                    $fname = $_POST['fname'];
                    $mname = $_POST['mname'];
                    $lname = $_POST['lname'];
                    $average = $_POST['average'];
                    $street = $_POST['street'];
                    $gender = $_POST['gender'];
                    $region_text = $_POST['region_text'];
                    $province_text = $_POST['province_text'];
                    $city_text = $_POST['city_text'];
                    $barangay_text = $_POST['barangay_text'];
    
                    if(!empty($sycode) && !empty($email) && !empty($fname) && !empty($mname) && !empty($lname) && !empty($average) && !empty($street) && !empty($gender) && !empty($region_text) && !empty($province_text) && !empty($city_text) && !empty($barangay_text))
                    {
                        $portCont->transSchoolEnrolleee($sycode, $email, $fname, $mname, $lname, $average, $street, $gender, $region_text, $province_text, $city_text, $barangay_text); 
                        header('Location: home.php?view=enrollment&message=success');    
                    }else{
                        header('Location: home.php?view=enrollment&message=error');
                    }
                }
                break;

            case "enroll_fresh":
                if(isset($_POST['update']))
                {
                    $eid = $_POST['eid'];
                    $uid = $_POST['uid'];
                    $gid = $_POST['gid'];
                    $status = $_POST['status'];

                    if(!empty($eid) && !empty($uid) && !empty($gid) &&  !empty($status))
                    {
                        if(strtoupper($status) == 'APPROVED'){
                            $checkSycode =  $portCont->freshSchoolEnrolleeeSyValidation($eid); 
                            if(!empty($checkSycode)){
                                $sycode = $checkSycode[0]['sycode'];
                                $checkGradeSycode = $portCont->getSchoolYearDetailsGrade($sycode); 
                                if(!empty($checkGradeSycode)){
                                    if(!empty(strtoupper($checkGradeSycode[0]['grade']) == 'GRADE 1')){
                                        $rgid = $checkGradeSycode[0]['gid'];
                                        $average = $checkSycode[0]['average'];
                                        $gender = $checkSycode[0]['gender'];
                                        $fname = $checkSycode[0]['fname'].' '.$checkSycode[0]['mname'].' '.$checkSycode[0]['lname'];
                                        $address = $checkSycode[0]['street'].' '.$checkSycode[0]['region_text'].' '.$checkSycode[0]['province_text'].' '.$checkSycode[0]['city_text'].' '.$checkSycode[0]['barangay_text'];
                                        $email = $checkSycode[0]['email']; 
                                        $pass = 'password-'.$uid;
                                        $hash = md5($pass);
                                        $code = rand(6666,9999);
                                        require "api/mailler/verificationmail.php";
                                        $portCont->addUserInformation($uid,$email,$hash,$code);
                                        $portCont->getSchoolEnrolleeFreshmen($rgid,$status,$uid,$eid); 

                                        $levelSectionBracketing = $portCont->getSchoolYearDetailsSectionSpecialBracketing($sycode,$average,$rgid);
                                        if(!empty($levelSectionBracketing)){
                                            $sid = $levelSectionBracketing[0]['sid'];
                                            $portCont->addFirstFreshRecord($sycode,$uid,$fname,$gender,$address,$rgid,$sid); 
                                            $portCont->addFirstFreshHistory($sycode,$uid,$rgid,$sid,$average); 
                                            header('Location: home.php?view=enrollment&message=success');  
                                        }
                                    }
                                }
                            }
                        }else{
                        header('Location: home.php?view=enrollment&message=error');    
                        }
                    }else{
                        header('Location: home.php?view=enrollment&message=error');
                    }
                }
                break;

            case "enroll_trans":
                if(isset($_POST['update']))
                {
                    $eid = $_POST['eid'];
                    $uid = $_POST['uid'];
                    $gid = $_POST['gid'];
                    $status = $_POST['status'];
                    if(!empty($eid) && !empty($uid) && !empty($gid) &&  !empty($status))
                    {
                        if(strtoupper($status) == 'APPROVED'){
                            $checkSycode =  $portCont->transSchoolEnrolleeeSyValidation($eid); 
                            if(!empty($checkSycode)){
                                $sycode = $checkSycode[0]['sycode'];
                                $checkGradeSycode = $portCont->getSchoolYearDetailsGrade($sycode); 
                                if(!empty($checkGradeSycode)){
                                        $rgid = $gid;
                                        $average = $checkSycode[0]['average'];
                                        $gender = $checkSycode[0]['gender'];
                                        $fname = $checkSycode[0]['fname'].' '.$checkSycode[0]['mname'].' '.$checkSycode[0]['lname'];
                                        $address = $checkSycode[0]['street'].' '.$checkSycode[0]['region_text'].' '.$checkSycode[0]['province_text'].' '.$checkSycode[0]['city_text'].' '.$checkSycode[0]['barangay_text'];
                                        $email = $checkSycode[0]['email']; 
                                        $pass = 'password-'.$uid;
                                        $hash = md5($pass);
                                        $code = rand(6666,9999);
                                        require "api/mailler/verificationmail.php";
                                        $portCont->addUserInformation($uid,$email,$hash,$code);
                                        $portCont->getSchoolEnrolleeTrans($rgid,$status,$uid,$eid); 

                                        $levelSectionBracketing = $portCont->getSchoolYearDetailsSectionSpecialBracketing($sycode,$average,$rgid);
                                        if(!empty($levelSectionBracketing)){
                                            $sid = $levelSectionBracketing[0]['sid'];
                                            $portCont->addFirstFreshRecord($sycode,$uid,$fname,$gender,$address,$rgid,$sid); 
                                            $portCont->addFirstFreshHistory($sycode,$uid,$rgid,$sid,$average); 
                                            header('Location: home.php?view=enrollment&message=success');  
                                        }
                                }
                            }
                        }else{
                        header('Location: home.php?view=enrollment&message=error');    
                        }
                    }else{
                        header('Location: home.php?view=enrollment&message=error');
                    }
                }
                break;

            case "reEnroll":
                if(isset($_POST['update'])){
                    $rid = $_POST['rid'];
                    $uid = $_POST['uid'];
                    $sycode  = $_POST['sycode'];
                    $average = $_POST['average'];

                    if(!empty($rid) && !empty($uid) && !empty($sycode) && !empty($average))
                    {
                        $ValidateImpersonation = $portCont->checkStudentRecord($rid);
                        if(!empty($ValidateImpersonation)){
                            $current_level = $ValidateImpersonation[0]['grade']; 
                            // Extract numeric part from the string
                            preg_match('/\d+/', $current_level, $matches);
                            $numeric_level = intval($matches[0]);

                            // Add 1 to the numeric part
                            $next_level = 'GRADE ' . ($numeric_level + 1);

                            $current_section = $ValidateImpersonation[0]['current_section']; 
                            $newLvl = $portCont->movingUp($sycode, $next_level);
                                 if (!empty($newLvl)) {

                                            $rgid = $newLvl[0]['gid']; 
                                            $levelSectionBracketing = $portCont->getSchoolYearDetailsSectionSpecialBracketing($sycode,$average,$rgid);
                                            if(!empty($levelSectionBracketing))
                                            {
                                                $sid = $levelSectionBracketing[0]['sid'];
                                                $portCont->updateStudentRecord($sycode,$uid,$rid,$rgid,$sid);
                                                $portCont->addFirstFreshHistory($sycode,$uid,$rgid,$sid,$average);
                                                $portCont->deleteConfirmation($uid);
                                                header('Location: home.php?view=enrollment&message=success'); 
                                            }else{
                                                header('Location: home.php?view=enrollment&message=error&rgid='.$rgid.'&sycode='.$sycode.'&average='.$average); 
                                            }
                                      
                                } else { 
                                    header('Location: home.php?view=enrollment&message=error&q2='.$next_level); 
                                }
                        }else{
                            header('Location: home.php?view=enrollment&message=error&q1'); 
                        }

                    }else{
                        header('Location: home.php?view=enrollment&message=error'); 
                    }
                }
                break;

                case "request_type":
                    if(isset($_POST['add'])){
                         $type = strtoupper($_POST['type']);
                         if(!empty($type)) {
                             $ifexisting = $portCont->checkRequestType($type);
                             if(empty($ifexisting)){
                             $portCont->addRequestType($type);
                             header('Location: home.php?view=request&message=success');
                             }else{
                            header('Location: home.php?view=request&message=duplicate');  
                             }
                         }else{
                             header('Location: home.php?view=request&message=error');  
                         }
                    }
                    break;

                case "createRequest":
                    if(isset($_POST['add']))
                    {
                        $sycode = $_POST['sycode'];
                        $uid = $_POST['uid'];
                        $request_type = $_POST['request_type'];
                        $requested_by = $_POST['requested_by'];
                        $note = $_POST['note'];

                        if(!empty($sycode) && !empty($uid) && !empty($request_type) && !empty($note) && !empty($requested_by))
                        {
                            $checkRequestValidation = $portCont->checkValidRequest($sycode, $uid, $request_type);
                            if(!empty($checkRequestValidation))
                            {
                            header('Location: home.php?view=request&message=duplicate');   
                            }else{
                            $portCont->addStudentRequest($sycode, $uid, $request_type, $note, $requested_by);
                            header('Location: home.php?view=request&message=success');     
                            }
                            
                        }else{
                            header('Location: home.php?view=request&message=error');  
                        }
                    }
                    break;

                case "requestHistory": 
                    if(isset($_POST['update']))
                    {
                        $reqid = $_POST['reqid'];
                        $status  = $_POST['status'];
                        $note = $_POST['note'];

                        if(!empty($reqid) && !empty($status) && !empty($note))
                        {
                            $checkRequestHistory = $portCont->VisitingStudentRequest($reqid);
                            if(!empty($checkRequestHistory)){
                                $unote = $checkRequestHistory[0]['note'];
                                $portCont->addStudentRequestHistory($reqid, $unote);
                                $portCont->updateStudentRequest($reqid, $note, $status);
                                header('Location: home.php?view=request&message=success'); 
                            }else{
                                header('Location: home.php?view=request&message=error');
                            }
                           
                        }else{
                            header('Location: home.php?view=request&message=error');
                        }
                    }
                    break;

                case "createAccountTeacher": 
                    if(isset($_POST['add']))
                    {
                        $sycode = $_POST['sycode'];
                        $uid = $_POST['uid'];
                        $email = $_POST['email'];
                        $fname = $_POST['fname'];
                        $mname = $_POST['mname'];
                        $lname = $_POST['lname'];
                        $street = $_POST['street'];
                        $region_text = $_POST['region_text'];
                        $province_text = $_POST['province_text'];
                        $city_text = $_POST['city_text'];
                        $barangay_text = $_POST['barangay_text'];
             
                        if(!empty($sycode) &&  !empty($uid) && !empty($email) && !empty($fname) && !empty($mname) && !empty($lname) && !empty($street) && !empty($region_text) && !empty($province_text) && !empty($city_text)  && !empty($barangay_text)  && !empty($barangay_text))
                        {
                            $pass = 'password-'.$uid;
                            $hash = md5($pass);
                            $code = rand(6666,9999);
                            $portCont->addTeacherInformationRecord($sycode, $uid, $fname,$mname, $lname, $street, $region_text, $city_text, $barangay_text);
                            $portCont->addUserTeacherInformation($uid,$email,$hash,$code);
                            require "api/mailler/verificationmailteacher.php";
                            header('Location: home.php?view=teacher-accounts&message=success');
                        }else{
                            header('Location: home.php?view=teacher-accounts&message=error');
                        }
                    }
                    break;

                    case "addannouncement":
                        if(isset($_POST['add'])){
                            $title = $_POST['title'];
                            $description = $_POST['description'];
                            $start = $_POST['start'];
                            $end = $_POST['end'];
                            $photoName = $_FILES['photo']['name'];
                            $photoTmpName = $_FILES['photo']['tmp_name'];

                            if(!empty($title) && !empty($description) && !empty($start) && !empty($end) && !empty($photoName))
                            {
                                $uploadDir = 'uploads'; // Set your desired upload directory
                                if (!file_exists($uploadDir)) {
                                    mkdir($uploadDir, 0777, true);
                                }
                    
                                // Move the uploaded file to the directory
                                $photoPath = $uploadDir . '/' . $photoName;
                                move_uploaded_file($photoTmpName, $photoPath);
                                $portCont->announcementCreation($title, $description, $start, $end, $photoPath);
                                header('Location: home.php?view=announcement&message=success');

                            }else{
                                header('Location: home.php?view=announcement&message=error');
                            }

                        }
                        break;


                    case "updateAnnouncement":
                        if(isset($_POST['update'])){
                            $id = $_POST['id'];
                            $title = $_POST['title'];
                            $description = $_POST['description'];
                            $start = $_POST['start'];
                            $end = $_POST['end'];
                            $photoName = $_FILES['photo']['name'];
                            $photoTmpName = $_FILES['photo']['tmp_name'];

                            if(!empty($id) && !empty($title) && !empty($description) && !empty($start) && !empty($end) && !empty($photoName))
                            {
                                $uploadDir = 'uploads'; // Set your desired upload directory
                                if (!file_exists($uploadDir)) {
                                    mkdir($uploadDir, 0777, true);
                                }
                    
                                // Move the uploaded file to the directory
                                $photoPath = $uploadDir . '/' . $photoName;
                                move_uploaded_file($photoTmpName, $photoPath);
                                $portCont->announcementUpdate($id, $title, $description, $start, $end, $photoPath);
                                header('Location: home.php?view=announcement&message=success');
                            }else{
                                header('Location: home.php?view=announcement&message=error');
                            }
                        }   
                        break;

                    case "generatemap":
                        if(isset($_POST['generate']))
                        {
                            $mid = $_POST['pieceIdInput']; 
                            $checkMap = $portCont->genMap($mid);
                            if(!empty($checkMap))
                            {
                                header('Location: home.php?view=direction&mid='.$checkMap[0]["mid"]);
                               
                            }else
                            {
                                header('Location: home.php?view=direction');
                            }
                          
        
                        }
                        break;


                    case "addlost":
                        if(isset($_POST['add'])){
                            $item = $_POST['item'];
                            $uid = $_POST['uid'];
                            $rid = $_POST['rid'];
                            $another = $_POST['another'];
                            $photoName = $_FILES['photo']['name'];
                            $photoTmpName = $_FILES['photo']['tmp_name'];

                            if(!empty($item) && !empty($uid) && !empty($rid) && !empty($another) && !empty($photoName))
                            {
                                $uploadDir = 'uploads'; // Set your desired upload directory
                                if (!file_exists($uploadDir)) {
                                    mkdir($uploadDir, 0777, true);
                                }
                    
                                // Move the uploaded file to the directory
                                $photoPath = $uploadDir . '/' . $photoName;
                                move_uploaded_file($photoTmpName, $photoPath);
                                $portCont->lostCreation($item, $uid, $rid, $another, $photoPath);
                                header('Location: home.php?view=lost&message=success');
                            }else{
                                header('Location: home.php?view=lost&message=error');
                            }
                        }
                        break;

                    case "updateStatuslost":
                        if(isset($_POST['update']))
                        {
                            $fid = $_POST['fid']; 
                            $status = $_POST['status']; 

                            if(!empty($fid) && !empty($status))
                            {
                                $portCont->lostUpdateStatusCreation($fid, $status);
                                header('Location: home.php?view=lost&message=success');
                            }else{
                                header('Location: home.php?view=lost&message=error');
                            }
                        }
                        break;

                    case "updateLost":
                        if(isset($_POST['update'])){
                            $fid = $_POST['fid'];
                            $item = $_POST['item'];
                            $foundby = $_POST['foundby'];
                            $foundin = $_POST['foundin'];
                            $status = $_POST['status'];
                            $another = $_POST['another'];
                            $photoName = $_FILES['photo']['name'];
                            $photoTmpName = $_FILES['photo']['tmp_name'];

                            if(!empty($fid) && !empty($item)  && !empty($foundby)  && !empty($foundin)  && !empty($status)  && !empty($another)  && !empty($photoName)){
                                $uploadDir = 'uploads'; // Set your desired upload directory
                                if (!file_exists($uploadDir)) {
                                    mkdir($uploadDir, 0777, true);
                                }
                    
                                // Move the uploaded file to the directory
                                $photoPath = $uploadDir . '/' . $photoName;
                                move_uploaded_file($photoTmpName, $photoPath);
                                $portCont->lostUpdate($fid, $item, $foundby, $foundin, $status, $another, $photoPath);
                                header('Location: home.php?view=lost&message=success');
                            }else{
                                header('Location: home.php?view=lost&message=error');
                            }

                        }
                        break;

                    case "verification":
                        if(isset($_POST['verification'])){
                            $code = $_POST['code']; 
                            $rcode = $_POST['rcode']; 
                            $password = $_POST['password'];
                            if(!empty($code) && !empty($rcode) && !empty($password))
                            {
                                if($code == $rcode){
                                    $email = $userSession[0]['email'];
                                    $hash = md5($password);
                                    require "api/mailler/newpassgeneric.php";
                                    $portCont->verifyUserCredentials($code, $hash);
                                    header('Location: home.php?view=home');
                                }else{
                                    header('Location: security.php?view=verification&message=error');
                                }
                            }else{
                                header('Location: security.php?view=verification&message=error');
                            }
                        }
                        break;

                    case "assignTeachSection":
                        if(isset($_POST['add']))
                        {
                            $uid = $_POST['uid']; 
                            $sycode = $_POST['sycode']; 
                            $sid = $_POST['sid'];
                            if(!empty($_POST['uid']) && !empty($_POST['sycode']) && !empty($_POST['sid']))
                            {
                                $checkExst = $portCont->checkIfExistingAlreadyTeacher($uid); 
                                if(!empty($checkExst))
                                {
                                    $prevSycode = $checkExst[0]['sycode'];
                                    $prevSid = $checkExst[0]['sid'];
                                    $portCont->updateSectionForTeacher($uid, $sycode, $sid);
                                    $portCont->insertSectionForTeacherHistory($uid, $prevSycode, $prevSid);
                                    // tbl_assigned_teacher_section_history
                                    header('Location: home.php?view=teacher-accounts&message=success');
                                }else{
                                    $portCont->addSectionForTeacher($uid, $sycode, $sid);
                                    header('Location: home.php?view=teacher-accounts&message=success');
                                }
                                header('Location: home.php?view=teacher-accounts&message=success');
                            }else{
                                header('Location: home.php?view=teacher-accounts&message=error');
                            }
                        }
                        break;


                    case "GradeSectionSearch":
                        if(isset($_POST['search'])){
                            $gid = $_POST['gid'];
                            $sid = $_POST['sid']; 

                            if(!empty($gid) && !empty($sid))
                            {
                                header('Location: home.php?view=student-accounts&gid='.$gid.'&sid='.$sid);
                            }else{
                                header('Location: home.php?view=student-accounts');
                            }
                        }
                        break;

                    case "GradeSectionSearch":
                        if(isset($_POST['clear'])){
                            header('Location: home.php?view=student-accounts');
                        }
                        break;

                    case "GradeSectionSearchMonitoring":
                        if(isset($_POST['search'])){
                            $gid = $_POST['gid'];
                            $sid = $_POST['sid']; 

                            if(!empty($gid) && !empty($sid))
                            {
                                header('Location: home.php?view=monitoring&gid='.$gid.'&sid='.$sid);
                            }else{
                                header('Location: home.php?view=monitoring');
                            }
                        }
                        break;

                        case "GradeSectionSearchMonitoring":
                            if(isset($_POST['clear'])){
                                header('Location: home.php?view=monitoring');
                            }
                            break;


                    case "proceedToEnroll":
                        if(isset($_POST['confirm'])){
                           $uid = $_POST['uid']; 
                           $sycode = $_POST['sycode']; 
                           $confirm = 'CONFIRM';
                           if(!empty($sycode) && !empty($sycode)){
                            $portCont->studentEnrollmentConsent($uid, $sycode, $confirm);
                            header('Location: home.php?view=enrollnow&message=success');
                           }
                        }
                        break;

                    case "proceedToEnroll":
                        if(isset($_POST['decline'])){
                           $uid = $_POST['uid']; 
                           $sycode = $_POST['sycode'];
                           $confirm = 'DECLINE';
                           if(!empty($sycode) && !empty($sycode)){
                            $portCont->studentEnrollmentConsent($uid, $sycode, $confirm);
                            header('Location: home.php?view=enrollnow&message=success');
                           } 
                        }
                        break;


                    case "UniqueGradeSectionSearch":
                        if(isset($_POST['generate'])){
                            $gid = $_POST['gid']; 
                            header('Location: home.php?view=student-accounts&gid='.$gid);
                        }
                        break;

                    case "buildingadd":
                        if(isset($_POST['assign'])){
                            $mid = $_POST['mid'];
                            $building = $_POST['building']; 
                            $room = $_POST['room']; 
                            if(!empty($mid) && !empty($building) && !empty($room))
                            {
                                $portCont->addRoomBuilding($mid, $room, $building);
                                header('Location: home.php?view=direction');
                            }
                        }
                        break;

                    case "updateDirectionForRoom":
                        if(isset($_POST['update'])){
                            $id = $_POST['id'];
                             $mid = $_POST['mid']; 
                             $building = $_POST['building'];  
                             $room = $_POST['room'];  
                             if(!empty($id) && !empty($mid) && !empty($building) && !empty($room)){
                                $portCont->updateEditRoomBuilding($id, $mid, $building, $room);
                                header('Location: home.php?view=direction&message=success');
                             }else{
                                header('Location: home.php?view=direction&message=error');
                             }
                        }
                        break;

                    case "preenrollState":

                        if(isset($_POST["Import"])){
		

                            echo $filename=$_FILES["file"]["tmp_name"];
                            
                    
                             if($_FILES["file"]["size"] > 0)
                             {
                    
                                  $file = fopen($filename, "r");
                                 while (($emapData = fgetcsv($file, 10000, ",")) !== FALSE)
                                 {

                                    $uid = date('Ymd').rand(6666,9999); 
                                    $sycode = $activatedSy[0]['sycode'];
                                    $email = $emapData[1];
                                    $fname = $emapData[2];
                                    $mname = $emapData[3];
                                    $lname = $emapData[4];
                                    $average = $emapData[5];
                                    $gender = $emapData[6];
                                    $street = $emapData[7];
                                    $region_text = $emapData[8];
                                    $province_text = $emapData[9];
                                    $city_text = $emapData[10];
                                   


                                    if (!empty($uid) && !empty($sycode) &&  !empty($email) && !empty($fname) && !empty($mname) && !empty($lname)  && !empty($average) && !empty($gender) && !empty($street) && !empty($region_text) && !empty($province_text) && !empty($city_text)) {
                                        // Perform your database operations here
                                        $portCont->addPreRegEnrollees($uid, $sycode, $email, $fname, $mname, $lname, $average, $street, $gender, $region_text, $province_text, $city_text);    
                                        header('Location:home.php?view=enrollment&message=success');
                                    }else{
                                        header('Location:home.php?view=enrollment&message=error');
                                    }
                    
                                 }
                                 fclose($file);
                             }
                        }	 

                    break;
                        
                       
                   

        
    }
}

?>