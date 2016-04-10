tesaApp.controller('progresController',['$scope', function($scope) {
  $scope.todolists = [
            {
                title: 'Prakualifikasi',
                defaultStyle: 'lobilist-info',
                items: [
                    {
                        title: 'NPWP',
                        description: 'Thunder fulfilled travellers folly, wading, lake.',
                        dueDate: '2015-01-31'
                    },
                    {
                        title: 'Dokumen C',
                        description: 'Accepted was mollis',
                        done: true
                    },
                    {
                        title: 'Dokumen A',
                        description: 'Rowed cloven frolic thereby, vivamus pining gown intruding strangers prank treacherously darkling.'
                    },
                    {
                        title: 'Accepted was mollis',
                        description: 'Rowed cloven frolic thereby, vivamus pining gown intruding strangers prank treacherously darkling.',
                        dueDate: '2015-02-02',
                        done: true
                    }
                ]
            },
            {
                title: 'Kualifikasi',
                items: [
                    {
                        title: 'RAB',
                        description: 'Thunder fulfilled travellers folly, wading, lake.',
                        dueDate: '2015-01-31'
                    },
                    {
                        title: 'CV Asanilta Fahda',
                        description: 'Accepted was mollis',
                        done: true
                    },
                    {
                        title: 'Dokumen Lalala',
                        description: 'Rowed cloven frolic thereby, vivamus pining gown intruding strangers prank treacherously darkling.'
                    }
                ]
            }
        ];
}]);
