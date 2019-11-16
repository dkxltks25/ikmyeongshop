
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" href = "../css/join.css">
</head>
<body>
    <header>
        <jsp:include page="../header.jsp"/>
    </header>
    <div class = "join__container">
        <div class="join_container_NowLocation">
            <em><a class = "join__container_link" href = "/" >HOME> </a> 회원가입> 가입방법 선택</em>
        </div>
        <div class="sub_content">

            <!-- //side_cont -->
            <div class="content_box">
                <div class="join_base_wrap">
                    <div class="member_tit">
                        <h2>회원가입</h2>

                    </div>
                    <!-- //member_tit -->
                    <div class="member_cont">
                        <form id="formJoin" name="formJoin" action="https://www.ikmyeongshop.com/member/member_ps.php" method="post" novalidate="novalidate">
                            <input type="hidden" name="rncheck" value="none">
                            <input type="hidden" name="dupeinfo" value="">
                            <input type="hidden" name="pakey" value="">
                            <input type="hidden" name="foreigner" value="">
                            <input type="hidden" name="adultFl" value="">
                            <input type="hidden" name="mode" value="join">

                            <!-- 회원가입/정보 기본정보 --><div class="base_info_box">
                            <h3>기본정보</h3>
                            <div class="base_info_sec">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <colgroup>
                                        <col width="25%">
                                        <col width="75%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th><span class="important">아이디</span></th>
                                        <td>
                                            <div class="member_warning">
                                                <input type="text" id="memId" name="memId" data-pattern="gdMemberId">
                                            </div>
                                        </td>

                                    </tr>
                                    <tr class="">
                                        <th><span class="important">비밀번호</span></th>
                                        <td class="member_password">
                                            <div class="member_warning">
                                                <input type="password" id="newPassword" name="memPw" autocomplete="off" placeholder="">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th><span class="important">비밀번호 확인</span></th>
                                        <td>
                                            <div class="member_warning">
                                                <input type="password" class="check-id" name="memPwRe" autocomplete="off">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="important">이름</span></th>
                                        <td>
                                            <div class="member_warning">
                                                <input type="text" name="memNm" data-pattern="gdEngKor" value="" maxlength="30">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="important">이메일</span></th>
                                        <td class="member_email">
                                            <div class="member_warning">
                                                <input type="text" name="email" id="email" value="" tabindex="-1">
                                                <select id="emailDomain" name="emailDomain" class="chosen-select" style="display: none;">
                                                    <option value="self">직접입력</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="hanmail.net">hanmail.net</option>
                                                    <option value="daum.net">daum.net</option>
                                                    <option value="nate.com">nate.com</option>
                                                    <option value="hotmail.com">hotmail.com</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="icloud.com">icloud.com</option>
                                                </select><div class="chosen-container chosen-container-single chosen-container-single-nosearch" style="width: 120px;" title="" id="emailDomain_chosen"><a class="chosen-single"><span>직접입력</span><div><b></b></div></a><div class="chosen-drop"><div class="chosen-search"><input type="text" autocomplete="off" readonly=""></div><ul class="chosen-results"></ul></div></div>
                                            </div>
                                            <div class="member_warning js_email"></div>
                                            <div class="form_element">
                                                <input type="checkbox" id="maillingFl" name="maillingFl" value="y">
                                                <label for="maillingFl" class="check_s ">정보/이벤트 메일 수신에 동의합니다.</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span>휴대폰번호</span></th>
                                        <td class="member_address">
                                            <div class="address_postcode">
                                                <input type="text" id="cellPhone" name="cellPhone" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="">
                                            </div>
                                            <div class="form_element">
                                                <input type="checkbox" id="smsFl" name="smsFl" value="y">
                                                <label for="smsFl" class="check_s ">정보/이벤트 SMS 수신에 동의합니다.</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span>전화번호</span></th>
                                        <td>
                                            <div class="member_warning">
                                                <input type="text" id="phone" name="phone" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span>주소</span></th>
                                        <td class="member_address">
                                            <div class="address_postcode">
                                                <input type="text" name="zonecode" readonly="readonly" value="">
                                                <button type="button" id="btnPostcode" class="btn_post_search">우편번호검색</button>
                                                <input type="hidden" name="zipcode" value="">
                                            </div>
                                            <div class="address_input">
                                                <div class="member_warning">
                                                    <input type="text" name="address" readonly="readonly" value="">
                                                </div>
                                                <div class="member_warning js_address_sub">
                                                    <input type="text" name="addressSub" value="">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- //base_info_sec -->
                        </div>
                            <!-- //base_info_box --><!-- 회원가입/정보 기본정보 -->
                            <!-- 회원가입/정보 사업자정보 --><!-- 회원가입/정보 사업자정보 -->
                            <!-- 회원가입/정보 부가정보 -->
                            <!-- 회원가입/정보 부가정보 -->


                            <div class="btn_center_box">
                                <button type="button" id="btnCancel" class="btn_member_cancel">취소</button>
                                <button type="button" class="btn_comfirm js_btn_join" value="회원가입">회원가입</button>
                            </div>
                            <!-- //btn_center_box -->
                        </form>
                    </div>
                    <!-- //member_cont -->
                </div>
                <!-- //join_base_wrap -->
            </div>
            <!-- //content_box -->
            <script type="text/javascript">
                var paycoProfile = [];
                var naverProfile = [];
                var thirdPartyProfile = Array;

                $(document).ready(function () {
                    var $formJoin = $('#formJoin');

                    $(':text:first', $formJoin).focus();

                    $('#btnCancel', $formJoin).click(function (e) {
                        e.preventDefault();
                        top.location.href = '/';
                    });

                    if ($('.js_datepicker').length) {
                        $('.js_datepicker').datetimepicker({
                            locale: 'ko',
                            format: 'YYYY-MM-DD',
                            dayViewHeaderFormat: 'YYYY MM',
                            viewMode: 'days',
                            ignoreReadonly: true,
                            debug: false,
                            keepOpen: false
                        });
                    }

                    $('#btnPostcode').click(function (e) {
                        e.preventDefault();
                        $('#address-error, #addressSub-error').remove();
                        $(':text[name=address], :text[name=addressSub]').removeClass('text_warning');
                        gd_postcode_search('zonecode', 'address', 'zipcode');
                    });

                    $('#btnCompanyPostcode').click(function (e) {
                        e.preventDefault();
                        $('#comAddress-error, #comAddressSub-error').remove();
                        $(':text[name=comAddress], :text[name=comAddressSub]').removeClass('text_warning');
                        gd_postcode_search('comZonecode', 'comAddress', 'comZipcode');
                    });



                    gd_select_email_domain('email');

                    gd_member2.init($formJoin);

                    $('.js_btn_join').click({form: $formJoin}, gd_member2.save);
                });
            </script>
        </div>
        </div>
    </div>
    <footer>
        <jsp:include page="../footer.jsp"/>
    </footer>
</body>
</html>
