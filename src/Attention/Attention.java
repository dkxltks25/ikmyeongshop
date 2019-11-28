package Attention;

public class Attention {
    private String AttentionId;
    private String UserId;
    private String ProductId;
    private String createAt;
    private String updateAt;

    public String getAttentionId() {
        return AttentionId;
    }

    public void setAttentionId(String attentionId) {
        AttentionId = attentionId;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String userId) {
        UserId = userId;
    }

    public String getProductId() {
        return ProductId;
    }

    public void setProductId(String productId) {
        ProductId = productId;
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
