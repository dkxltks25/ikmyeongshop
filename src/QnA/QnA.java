package QnA;

public class QnA {
        private String QnAId;
        private String UserId;
        private String QnAtitle;
        private String QnAcontent;
        private String QnAClass;
        private String createAt;
        private String updateAt;

    public String getQnAId() {
        return QnAId;
    }

    public void setQnAId(String qnAId) {
        QnAId = qnAId;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String userId) {
        UserId = userId;
    }

    public String getQnAtitle() {
        return QnAtitle;
    }

    public void setQnAtitle(String qnAtitle) {
        QnAtitle = qnAtitle;
    }

    public String getQnAcontent() {
        return QnAcontent;
    }

    public void setQnAcontent(String qnAcontent) {
        QnAcontent = qnAcontent;
    }

    public String getQnAClass() {
        return QnAClass;
    }

    public void setQnAClass(String qnAClass) {
        QnAClass = qnAClass;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }
}
