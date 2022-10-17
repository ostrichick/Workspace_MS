<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지사항</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<style>
body {
  background-color: #eee;
}

.bdge {
  height: 21px;
  background-color: orange;
  color: #fff;
  font-size: 11px;
  padding: 8px;
  border-radius: 4px;
  line-height: 3px;
}

.comments {
  text-decoration: underline;
  text-underline-position: under;
  cursor: pointer;
}

.dot {
  height: 7px;
  width: 7px;
  margin-top: 3px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}

.hit-voting:hover {
  color: blue;
}

.hit-voting {
  cursor: pointer;
}
</style>
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <div class="container" style="margin: 30px auto;">
    <div class="container my-1">
      <div class="row">
        <table class="table table-bordered">
          <thead>
            <tr class="table-active">
              <th scope="col" class="col-6"><h3>${boardVo.title}<span>[${boardVo.reply_count}]</span>
                </h3></th>
              <th scope="col" class="col-6 text-right"><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${boardVo.wdate}" /><br />조회 : ${boardVo.hit}</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td colspan="2">
                <pre>${boardVo.content}</pre>
              </td>
            </tr>
          </tbody>
        </table>

        <div class="coment-bottom bg-white p-2 px-4 col-12">
          <div class="d-flex flex-row add-comment-section mt-4 mb-4">
            <input type="text" class="form-control mr-3" name="reply_content" id="reply_content" placeholder="댓글을 작성해주세요.">
            <button class="btn btn-outline-secondary col-xs-4 col-lg-1 col-md-2 col-sm-3" type="button" onclick="writeReply()">작성</button>
          </div>
          <div id="comment_parent" class="commented-section mt-2"></div>
          <!-- 더미 리플 끝 -->



        </div>
      </div>


    </div>
    <div class="txt-right">
      <button onClick='toList()' class="toList btn btn-secondary mb-3">목록으로</button>
      <c:if test="${member_admin eq 'Y' }">
        <button onClick='toEdit()' class="toEdit btn btn-secondary mb-3">수정</button>
        <button onClick='toDelete()' class="toDelete btn btn-secondary mb-3">삭제</button>
      </c:if>
    </div>
  </div>
  <script>
      function toList() {
        location.href = "${MaruContextPath}/notice/list";
      }
      function toEdit() {
        let url = "${MaruContextPath}/notice/edit?idx=";
        let idx = "${boardVo.idx}"
        url += idx;
        location.href = url;
      }
      function toDelete() {
        let url = "${MaruContextPath}/notice/delete?idx=";
        let idx = "${boardVo.idx}"
        url += idx;
        location.href = url;
      }
    </script>

  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script>
      let idx = "${boardVo.idx}"
      let session_member_idx = "${sessionScope.member_idx}"
      let session_member_admin = "${sessionScope.member_admin}"

      function getReplyList() {
        $.ajax({
          type : 'GET',
          url : 'reply/list?idx=' + idx,
          data : idx,
          //dataType:"json", // json으로 지정 안하면 xml로 받아옴
          success : function(result) {
            var items = $(result).find("item");
            $("div#comment_parent").empty();
            $(items).each(function(index, item) {

              let comment_section = '<section class="comment m-tb-10"><div class="d-flex flex-row align-items-center commented-user"><h5 class="mr-2">';
              let reply_date = parseInt($(item).find("reply_date").text());
              //reply_date += 32400; // 유닉스 시간으로 받아올경우 세계표준시므로 한국시간을 표현하려면 9시간 32400초를 더함
              //let reply_date_format = new Date(reply_date).toISOString().slice(0, 19).replace('T', ' ');

              comment_section += $(item).find("member_name").text();
              comment_section += '</h5><span class="dot mb-1"></span><span class="mb-1 ml-2">';
              comment_section += $(item).find("reply_date").text();
              //comment_section += reply_date_format;
              comment_section += '</span> <span class="dot ml-2 mr-2"></span>'

              if (session_member_idx == parseInt($(item).find("member_idx").text())) {
                /** 멤버 idx가 일치할 시에만 수정, 삭제 버튼 출력*/
                comment_section += '<span><a href="javascript:void(0)" onclick="openEditor(this)">수정</a></span> <span class="dot ml-2 mr-2"></span><span><a href="javascript:void(0)" onclick="removeReply(this)">삭제</a></span><input type="hidden" name="reply_idx" value="';
                comment_section += $(item).find("reply_idx").text();
                comment_section += '"><input type="hidden" name="member_idx" value="';
                comment_section += $(item).find("member_idx").text();
                comment_section += '">'
                /** 이 위로 member_idx 일치 유저만 출력*/
              } else if (session_member_admin == 'Y') {
                /** 관리자인 경우엔 삭제버튼만 출력 */
                comment_section += '<span><a href="javascript:void(0)" onclick="removeReply(this)">삭제</a></span><input type="hidden" name="reply_idx" value="';
                comment_section += $(item).find("reply_idx").text();
                comment_section += '"><input type="hidden" name="member_idx" value="';
                comment_section += $(item).find("member_idx").text();
                comment_section += '">'
              }
              comment_section += '</div><div class="comment-text-sm"><span>';
              comment_section += $(item).find("reply_content").text();
              comment_section += '</span><div class="editor_parent"></div><div class="reply-section"><div class="d-flex flex-row align-items-center voting-icons txt-right"><h6 class="ml-2 mt-1 txt-right pull-right "></h6></div></div></section>';
              $("div#comment_parent").append(comment_section);
            })
            console.log("불러오기 성공");
          },
          error : function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
          },
        })
      }

      function writeReply() {
        if ($("input#reply_content").val() !== "") {
          $.ajax({
            type : 'post',
            url : 'reply/write?idx=' + idx,
            data : {
              idx : idx,
              reply_content : $("input#reply_content").val()
            },
            success : function(result) {
              console.log(result);
              console.log("작성 성공");
              $("input#reply_content").val("")
              getReplyList();
            },
            error : function(request, status, error) {
              alert("status:" + status + "\n\n" + "code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
              console.log(status);
              console.log(request);
              console.log(error);
            },
          })
        }
      }

      function openEditor(obj) {
        console.log(obj);
        let reply_idx = $(obj).parent().parent().find("input[name=reply_idx]").val();
        let member_idx = $(obj).parent().parent().find("input[name=member_idx]").val();
        let parentof_editor = $(obj).parent().parent().next().find("div.editor_parent");

        let editor = "";
        editor += '<div class="d-flex flex-row add-comment-section mt-4 mb-4"><input type="text" class="form-control mr-3" name="reply_content" id="reply_content" placeholder="댓글을 수정합니다."><button class="btn btn-outline-secondary col-xs-4 col-lg-1 col-md-2 col-sm-3" type="button" onclick="editReplyProcess(';
        editor += reply_idx + ',' + member_idx + ', this';
        editor += ')">수정</button></div>';

        $(parentof_editor).append(editor);

      }
      function editReplyProcess(reply_idx, member_idx, obj) {
        let reply_content = $(obj).prev().val();
        if ($(obj).prev().val() != "") {
          $.ajax({
            type : 'post',
            url : 'reply/edit?reply_idx=' + reply_idx,
            data : {
              member_idx : member_idx,
              reply_content : reply_content,
            },
            success : function(result) {
              console.log(result);
              console.log("수정 성공");
              getReplyList();

            },
            error : function(request, status, error) {
              alert("status:" + status + "\n\n" + "code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
              console.log(status);
              console.log(request);
              console.log(error);
            },
          })
        }
      }
      function removeReply(obj) {
        console.log(obj);
        let reply_idx = $(obj).parent().next().val();
        let member_idx = $(obj).parent().next().next().val();

        $.ajax({
          type : 'post',
          url : 'reply/remove?reply_idx=' + reply_idx,
          data : {
            member_idx : member_idx,
          },
          success : function(result) {
            console.log(result);
            console.log("삭제 성공");
            getReplyList();
          },
          error : function(request, status, error) {
            alert("status:" + status + "\n\n" + "code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
            console.log(status);
            console.log(request);
            console.log(error);
          },
        })
      }

      getReplyList();
    </script>
</body>
</html>