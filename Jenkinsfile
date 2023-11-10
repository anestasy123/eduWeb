pipeline
{
    agent {label 'Built-In Node'}
    stages
    {
        stage ('git') 
        {
            steps
            {
            git branch: 'main', url: 'https://github.com/anestasy123/eduWeb.git'
            }
            
        }
        
        stage ('artifact')
        {
            steps
            {
            sh ' tar -cf web.tar * '
            archiveArtifacts artifacts: 'web.tar', fingerprint: true
            }
            
        }
        
        stage ('deploy')
        {
            agent {label 'slave_1'}
            steps 
            {
                copyArtifacts filter: 'web.tar', fingerprintArtifacts: true, projectName: env.JOB_NAME , selector: lastSuccessful(), target: '/var/www/html'
                sh '''
                cd /var/www/html/ && rm -f index.html
                tar -xvf /var/www/html/web.tar -C /var/www/html/
                '''
                
                
                
            }
            
        }
    }
        
    }
