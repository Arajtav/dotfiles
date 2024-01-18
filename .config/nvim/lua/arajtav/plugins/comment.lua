local setup, comment = pcall(require, "Comment")
if not setup then
    print("Comment failed")
    return
end

comment.setup()
