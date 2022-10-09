const Migration = () => {
  return (
    <section class="bg-white py-20 lg:py-[120px] grid place-items-center">
      <div class="container">
        <div class="flex flex-wrap -mx-4">
          <div class="w-full px-4">
            <div class="max-w-full overflow-x-auto">
              <table class="table-auto w-full">
                <thead>
                  <tr class="bg-blue-700 text-center">
                    <th
                      class="
                           w-1/6
                           min-w-[160px]
                           text-lg
                           font-semibold
                           text-white
                           py-4
                           lg:py-7
                           px-3
                           lg:px-4
                           border-l border-transparent
                           "
                    >
                      Video
                    </th>
                    <th
                      class="
                           w-1/6
                           min-w-[160px]
                           text-lg
                           font-semibold
                           text-white
                           py-4
                           lg:py-7
                           px-3
                           lg:px-4
                           "
                    >
                      Wallet
                    </th>
                    <th
                      class="
                           w-1/6
                           min-w-[160px]
                           text-lg
                           font-semibold
                           text-white
                           py-4
                           lg:py-7
                           px-3
                           lg:px-4
                           "
                    >
                      Country
                    </th>
                    <th
                      class="
                           w-1/6
                           min-w-[160px]
                           text-lg
                           font-semibold
                           text-white
                           py-4
                           lg:py-7
                           px-3
                           lg:px-4
                           "
                    >
                      Travel date
                    </th>
                    <th
                      class="
                           w-1/6
                           min-w-[160px]
                           text-lg
                           font-semibold
                           text-white
                           py-4
                           lg:py-7
                           px-3
                           lg:px-4
                           border-r border-transparent
                           "
                    >
                      Action
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td
                      class="
                           text-center text-dark
                           font-medium
                           text-base
                           py-5
                           px-2
                           bg-[#F3F6FF]
                           border-b border-l border-[#E8E8E8]
                           "
                    >
                      video
                    </td>
                    <td
                      class="
                           text-center text-dark
                           font-medium
                           text-base
                           py-5
                           px-2
                           bg-[#F3F6FF]
                           border-b border-[#E8E8E8]
                           "
                    >
                      0x128...122
                    </td>
                    <td
                      class="
                           text-center text-dark
                           font-medium
                           text-base
                           py-5
                           px-2
                           bg-white
                           border-b border-[#E8E8E8]
                           "
                    >
                      AR
                    </td>
                    <td
                      class="
                           text-center text-dark
                           font-medium
                           text-base
                           py-5
                           px-2
                           bg-[#F3F6FF]
                           border-b border-[#E8E8E8]
                           "
                    >
                      12-08-2022
                    </td>
                    <td
                      class="
                           text-center text-dark
                           font-medium
                           text-base
                           py-5
                           px-2
                           bg-white
                           border-b border-r border-[#E8E8E8]
                           "
                    >
                      <button
                        className="
                              border border-green-700
                              py-1
                              px-2
                              text-green-700
                              inline-block
                              rounded
                              hover:bg-green-700 hover:text-white
                              "
                      >
                        Allow
                      </button>{" "}
                      <button
                        className="
                              border border-orange-700
                              py-1
                              px-2
                              text-orange-700
                              inline-block
                              rounded
                              hover:bg-orange-700 hover:text-white
                              "
                      >
                        Interview
                      </button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Migration;
