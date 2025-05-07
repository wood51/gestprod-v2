<form id="filtres" method="get">
  <table class="table table-zebra border overflow-auto">
    <thead class="bg-slate-100">
      <th><label for="check_all"></label><input id="check_all" type="checkbox" /></th>
      <!-- Référence -->
      <th>
        Référence <span class="badge badge-sm">{{ count(@filters.reference) }}</span>
        <!-- change popover-1 and --anchor-1 names. Use unique names for each dropdown -->
        <button type="button" class="btn btn-ghost" popovertarget="refs-dd" style="anchor-name: --refs-dd-anchor">
          <i class="fas fa-caret-down text-lg"></i>
        </button>
        <div
          popover
          class="dropdown dropdown-end card w-52 max-h-52 overflow-auto rounded-box bg-base-100 shadow-lg p-4"
          id="refs-dd"
          style="position-anchor: --refs-dd-anchor"
        >
          <div id="checkboxes-refs" class="flex flex-col gap-1 p-1">
            <repeat group="{{@filters.reference}}" value="{{@filter}}">
              <label for="{{@filter}}">
                <input
                  id="{{@filter}}"
                  type="checkbox"
                  name="ref[]"
                  value="{{@filter}}"
                  hx-get="/planning"
                  hx-trigger="change"
                  hx-target="#planning"
                  hx-include="#filtres"
                  {{ in_array(@filter, @selected_types) ? 'checked' : '' }}
                />
                {{@filter}}
              </label>
            </repeat>
          </div>
          <div class="flex justify-center gap-1">
            <button class="btn btn-xs btn-error" hx-get="/planning" hx-target="#planning" hx-trigger="click" hx-vals='"refs":"reset"'>Reset</button>
          </div>
        </div>
      </th>

      <!-- Type -->
      <th>
        Type <span class="badge badge-sm">{{ count(@filters.type) }}</span>
        <!-- change popover-1 and --anchor-1 names. Use unique names for each dropdown -->
        <button type="button" class="btn btn-ghost" popovertarget="type-dd" style="anchor-name: --type-dd-anchor">
          <i class="fas fa-caret-down text-lg"></i>
        </button>
        <div
          popover
          class="dropdown dropdown-end card w-52 max-h-52 overflow-auto rounded-box bg-base-100 shadow-lg p-4"
          id="type-dd"
          style="position-anchor: --type-dd-anchor"
        >
          <div id="checkboxes-types" class="flex flex-col gap-1 p-1">
            <repeat group="{{@filters.type}}" value="{{@filter}}">
              <label for="{{@filter}}">
                <input
                  id="{{@filter}}"
                  type="checkbox"
                  name="type[]"
                  value="{{@filter}}"
                  hx-get="/planning"
                  hx-trigger="change"
                  hx-target="#planning"
                  hx-include="#filtres"
                  {{ in_array(@filter, @selected_types) ? 'checked' : '' }}
                />
                {{@filter}}
              </label>
            </repeat>
          </div>

          <div class="flex justify-center gap-1">
            <button class="btn btn-xs btn-error" hx-get="/planning" hx-target="#planning" hx-trigger="click" hx-vals='"type":"reset"'>Reset</button>
          </div>
        </div>
      </th>

      <!-- Numéro -->
      <th>Numéro</th>

      <th>Semaine</th>
      <th>Engagement</th>
      <th>Prête</th>
      <th class=""></th>
    </thead>

    <tbody>
      <repeat group="{{@produits}}" value="{{@produit}}">
        <tr>
          <td><label for="check_{{@produit._id}}"></label> <input id="check_{{@produit._id}}" type="checkbox" /></td>
          <td class="flex items-start space-x-2">
            <span style="background-color: {{@produit.reference_couleur}}" class="w-4 h-6 rounded-sm"> </span>
            <span>{{@produit.reference}}</span>
          </td>
          <td>{{@produit.type}}</td>
          <td>
            <check if="{{@produit.numero}}">
              <true> {{@produit.numero}} </true>
              <false><span class="italic">NC</span></false>
            </check>
          </td>
          <td>{{@produit.semaine}}</td>

          <td>
            <span
              class="badge badge-outline badge-sm text-sm font-medium 
                          {{ 
                            (@produit.status=='Fait' ? 'badge-success' : 
                            (@produit.status=='Prévu' ? 'badge-info' : 
                            (@produit.status=='En Attente' ? 'badge-warning' : 
                            'badge-neutral' )))
                          }}"
            >
              {{@produit.status}}
            </span>
          </td>
          <td class="text-xl">
            <check if="{{@produit.prete}}">
              <true><i class="fa-solid fa-check text-success"></i></true>
              <false>
                <check if="{{@produit.status==='Prévu'}}">
                  <true><i class="fas fa-xmark text-error"></i></true>
                  <false><i class="far fa-hourglass-half text-info"></i></false>
                </check>
              </false>
            </check>
          </td>
          <td><i class="fas fa-ellipsis-vertical"></i></td>
        </tr>
      </repeat>
    </tbody>
  </table>
</form>
<script>
  //  document.body.addEventListener('htmx:configRequest', function (evt) {
  //     const params = new URLSearchParams(evt.detail.parameters);
  //     console.log('👉 Requête HTMX envoyée avec :');
  //     for (const [key, value] of params.entries()) {
  //       console.log(`${key} = ${value}`);
  //     }
  //   });
</script>
