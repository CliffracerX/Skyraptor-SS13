import { useBackend, useLocalState } from 'tgui/backend';
import { Button, NoticeBox, Section, Stack } from 'tgui/components';

import { DOOR_JACK, HOST_SCAN, PHOTO_MODE, SOFTWARE_DESC } from './constants';
import { PaiData } from './types';

/**
 * Renders two sections: A section of buttons and
 * another section that displays the selected installed
 * software info.
 */
export const InstalledDisplay = (props) => {
  return (
    <Stack fill vertical>
      <Stack.Item grow>
        <InstalledSoftware />
      </Stack.Item>
      <Stack.Item grow={2}>
        <InstalledInfo />
      </Stack.Item>
    </Stack>
  );
};

/** Iterates over installed software to render buttons. */
const InstalledSoftware = (props) => {
  const { data } = useBackend<PaiData>();
  const { installed = [] } = data;
  const [currentSelection, setCurrentSelection] = useLocalState('software', '');

  return (
    <Section fill scrollable title="Installed Software">
      {!installed.length ? (
        <NoticeBox>Nothing installed!</NoticeBox>
      ) : (
        installed.map((software, index) => {
          return (
            <Button key={index} onClick={() => setCurrentSelection(software)}>
              {software}
            </Button>
          );
        })
      )}
    </Section>
  );
};

/** Software info for buttons clicked. */
const InstalledInfo = (props) => {
  const [currentSelection] = useLocalState('software', '');
  const title = !currentSelection ? 'Select a Program' : currentSelection;

  return (
    <Section fill scrollable title={title}>
      {currentSelection && (
        <Stack fill vertical>
          <Stack.Item>{SOFTWARE_DESC[currentSelection]}</Stack.Item>
          <Stack.Item grow>
            <SoftwareButtons />
          </Stack.Item>
        </Stack>
      )}
    </Section>
  );
};

/**
 * Once a software is selected, generates custom buttons or a default
 * power toggle.
 */
const SoftwareButtons = (props) => {
  const { act, data } = useBackend<PaiData>();
  const { door_jack, languages, master_name } = data;
  const [currentSelection] = useLocalState('software', '');

  switch (currentSelection) {
    case 'Door Jack':
      return (
        <>
          <Button
            disabled={!!door_jack}
            icon="plug"
            onClick={() => act(currentSelection, { mode: DOOR_JACK.Cable })}
            tooltip="Drops a cable. Insert into a compatible airlock.">
            Extend Cable
          </Button>
          <Button
            color="bad"
            disabled={!door_jack}
            icon="door-open"
            onClick={() => act(currentSelection, { mode: DOOR_JACK.Hack })}
            tooltip="Begins overriding the airlock security protocols.">
            Hack Door
          </Button>
          <Button
            disabled={!door_jack}
            icon="unlink"
            onClick={() => act(currentSelection, { mode: DOOR_JACK.Cancel })}>
            Cancel
          </Button>
        </>
      );
    case 'Host Scan':
      return (
        <>
          <Button
            icon="hand-holding-heart"
            onClick={() => act(currentSelection, { mode: HOST_SCAN.Target })}
            tooltip="Must be held or scooped up to scan.">
            Scan Holder
          </Button>
          <Button
            disabled={!master_name}
            icon="user-cog"
            onClick={() => act(currentSelection, { mode: HOST_SCAN.Master })}
            tooltip="Scans any bound masters.">
            Scan Master
          </Button>
        </>
      );
    case 'Photography Module':
      return (
        <>
          <Button
            icon="camera-retro"
            onClick={() => act(currentSelection, { mode: PHOTO_MODE.Camera })}
            tooltip="Toggles the camera. Click an area to take a photo.">
            Camera
          </Button>
          <Button
            icon="print"
            onClick={() => act(currentSelection, { mode: PHOTO_MODE.Printer })}
            tooltip="Gives a list of stored photos.">
            Printer
          </Button>
          <Button
            icon="search-plus"
            onClick={() => act(currentSelection, { mode: PHOTO_MODE.Zoom })}
            tooltip="Adjusts zoom level on future photographs.">
            Zoom
          </Button>
        </>
      );
    case 'Universal Translator':
      return (
        <Button
          icon="download"
          onClick={() => act(currentSelection)}
          disabled={!!languages}>
          {!languages ? 'Install' : 'Installed'}
        </Button>
      );
    default:
      return (
        <Button
          icon="power-off"
          onClick={() => act(currentSelection)}
          tooltip="Attempts to enable the module.">
          Toggle
        </Button>
      );
  }
};
