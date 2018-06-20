resource :iams3, 'AWS::IAM::ManagedPolicy', DependsOn: :bucket do
  policy_document(
    Version: '2012-10-17',
    Statement: [
      {
        Effect: :Allow,
        Action: [
          's3:CopyObject',
          's3:DeleteObject',
          's3:GetObject',
          's3:PutObject'
        ],
        Resource: Fn::join('/', Fn::get_att(:bucket, :Arn), '*'),
      }
    ]
  )
end

output :IamS3, Fn::ref(:iams3), export: Fn::sub('${AWS::StackName}-IamS3')
