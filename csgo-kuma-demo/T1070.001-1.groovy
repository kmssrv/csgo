pipeline {
    agent {label 'windows'}

    stages {
        stage('Run KUMA Atomic T1070.001-1: R050_01_Очистка журнала событий Windows через командную строку using wevtutil') {
            steps {
                powershell '''
					Invoke-AtomicTest T1070.001 -PathToAtomicsFolder "C:\\kuma-atomics" -TestNumbers 1
				'''
            }
        }
        stage('Recive alert from KUMA: R050_01'){
            options {
                timeout(time: 1, unit: "MINUTES")
            }
            steps {
                script {
                    hook = registerWebhook(token: "webhook")
                    callbackURL = hook.url
                    data = waitForWebhook hook
                }
            }
        }
    }
}