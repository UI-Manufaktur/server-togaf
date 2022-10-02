module servers.togaf.controllers.actions.abbs.update;

@safe:
import servers.togaf;

class DTGFAbbUpdateActionController : DMVCActionController {
  mixin(MVCControllerThis!("TGFAbbUpdateActionController"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerCalls!("TGFAbbUpdateActionController", "DTGFAbbUpdateActionController"));
