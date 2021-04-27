import TiATT from 'ti.att';

const window = Ti.UI.createWindow();

const btn = Ti.UI.createButton({ title: 'Request permissions' });
btn.addEventListener('click', () => requestPermissions());

console.warn(`Authorization Status: ${formattedTrackingStatus(TiATT.trackingAuthorizationStatus)}`);

window.add(btn);
window.open();

function requestPermissions() {
    if (!TiATT.hasTrackingPermissions()) {
        TiATT.requestTrackingPermissions(event => {
            if (!event.success) {
                alert('Permission denied!');
                return;
            }

            alert('Now has tracking permissions!');
            console.warn(`Authorization Status: ${formattedTrackingStatus(event.status)}`);
        });
    } else {
        alert('Already has tracking permissions!');
    }
}

function formattedTrackingStatus(status) {
    switch (status) {
        case TiATT.AUTHORIZATION_STATUS_AUTHORIZED: return '✨ Authorized';
        case TiATT.AUTHORIZATION_STATUS_DENIED: return '💩 Denied';
        case TiATT.AUTHORIZATION_STATUS_RESTRICTED: return '🔒 Restricted';
        case TiATT.AUTHORIZATION_STATUS_NOT_DETERMINED:
        default: return '❓ Not determined';
    }
}