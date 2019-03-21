########################################################################################################################
#!!
#! @description: Generated flow description.
#!
#! @input input_1: Generated description.
#! @input input_2: Generated description.
#!
#! @output output_1: Generated description.
#!
#! @result SUCCESS: Flow completed successfully.
#! @result FAILURE: Failure occurred during execution.
#!!#
########################################################################################################################

namespace: oo_cloudslang.content.workflows.demo_flows

namespace: Workflows
flow:
  name: numgen
  workflow:
    - random_number_generator:
        do:
          io.cloudslang.base.math.random_number_generator:
            - min: '80'
            - max: '150'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: FAILURE
  outputs:
    - flow_output_0: return_result
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      random_number_generator:
        x: 327
        y: 254
        navigate:
          302a03e3-892b-e07f-0e8e-a36d92a9aa80:
            targetId: 1e614dc2-bc57-b5ec-de73-8af33dc828b6
            port: SUCCESS
          81b5f814-3914-9331-17de-96ab956a373a:
            targetId: 2088b625-b4cb-024d-52cf-5ac6450c5cbe
            port: FAILURE
    results:
      SUCCESS:
        1e614dc2-bc57-b5ec-de73-8af33dc828b6:
          x: 593
          y: 242
      FAILURE:
        2088b625-b4cb-024d-52cf-5ac6450c5cbe:
          x: 478
          y: 461
