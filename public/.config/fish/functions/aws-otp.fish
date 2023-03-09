# Requires presence of environment variable AWS_ITEM that points to the
# item in the vault from which to read the OTP. Works nicely with direnv
# when item is different based on the project
function aws-otp --description 'Gets AWS OTP from vault'
    op item get --otp $AWS_ITEM
end
