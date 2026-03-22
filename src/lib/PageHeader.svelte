<script lang="ts">
  import { getModalStore, type ModalSettings } from "@skeletonlabs/skeleton";
  import { fetchingSteamData, steamUserName } from "./stores";
  import WhatModal from "./components/modals/WhatModal.svelte";
  import InstructionsModal from "./components/modals/InstructionsModal.svelte";
</script>

<div class="container h-full mx-auto flex justify-center items-center pt-5">
  <div class="space-y-3 text-center flex flex-col items-center">
    <h2 class="h2">Kingdom Hearts Steam Achievement Tracker</h2>
    <WhatModal />
    <!-- / -->
    <div class="flex justify-center space-x-1">
      <p>
        Put your Steam ID in below, submit, and we'll list your achievements.<br
        />
        Not your Steam <i>display name</i>. It's the one shown in the URL when
        you visit your profile.<br /><br />
        Keep in mind that your profile has to be public for this to work.<br />
        <InstructionsModal />
      </p>
    </div>
    <form method="post" action="/">
      <input
        bind:value={$steamUserName}
        name="steamname"
        class="input"
        type="text"
        placeholder="Steam name"
      />
      <button
        on:click={() => {
          fetchingSteamData.set(true);
        }}
        type="submit"
        class="btn variant-filled-surface m-2">Submit</button
      >
    </form>
  </div>
</div>
