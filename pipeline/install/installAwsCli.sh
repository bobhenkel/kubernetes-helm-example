#! /bin/bash -e

echo "installing AWS CLI..."

# add AWS credentials
if [[ ! -d ~/.aws ]]; then
  mkdir ~/.aws
fi
echo -e "[gitlabCi]\naws_access_key_id=$AWS_ACCESS_KEY_ID\naws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> ~/.aws/credentials
export AWS_DEFAULT_PROFILE=gitlabCi

# install AWS CLI
# install Python and PIP if not installed
if [[ ! $(which python) ]]; then
  sudo $INSTALL_CMD python
  curl -O https://bootstrap.pypa.io/get-pip.py
  sudo python get-pip.py
fi
# install AWS CLI
if [[ ! $(which aws) ]]; then
  sudo $(which pip) install awscli
  if [[ $(aws help) ]]; then
    echo "AWS CLI installed successfully"
  fi
fi
