#   (c) Copyright 2017 EntIT Software LLC, a Micro Focus company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
########################################################################################################################
#!!
#! @description: Creates a Jenkins job.
#!
#! @prerequisites: jenkinsapi Python module
#!
#! @input url: URL to Jenkins
#! @input job_name: name of job to create
#! @input config_xml: configuration xml used to create a Jenkins job, actual file must be passed not its path
#!
#! @output result_message: operation results
#!
#! @result SUCCESS: return code is 0
#! @result FAILURE: otherwise
#!!#
########################################################################################################################

namespace: io.cloudslang.jenkins

operation:
  name: create_job

  inputs:
    - url
    - job_name
    - config_xml

  python_action:
    script: |
      try:
        from jenkinsapi.jenkins import Jenkins

        j = Jenkins(url)
        jobs = j.jobs
        job = jobs.create(job_name, config_xml)

        return_code = '0'
        result_message = 'Success'
      except IOError as e:
        print "Unexpected error:", e
        return_code = '-1'
        result_message = 'Error while creating job: ' + job_name

  outputs:
    - result_message

  results:
    - SUCCESS: ${ return_code == '0' }
    - FAILURE
