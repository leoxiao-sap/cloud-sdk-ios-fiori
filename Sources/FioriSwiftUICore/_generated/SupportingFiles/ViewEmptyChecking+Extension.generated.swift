// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

extension AccessoryIcon: _ViewEmptyChecking {
    public var isEmpty: Bool {
        accessoryIcon.isEmpty
    }
}

extension Action: _ViewEmptyChecking {
    public var isEmpty: Bool {
        action.isEmpty
    }
}

extension Avatars: _ViewEmptyChecking {
    public var isEmpty: Bool {
        avatars.isEmpty
    }
}

extension CardBody: _ViewEmptyChecking {
    public var isEmpty: Bool {
        cardBody.isEmpty
    }
}

extension Card: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mediaImage.isEmpty &&
            description.isEmpty &&
            title.isEmpty &&
            subtitle.isEmpty &&
            icons.isEmpty &&
            detailImage.isEmpty &&
            headerAction.isEmpty &&
            counter.isEmpty &&
            row1.isEmpty &&
            row2.isEmpty &&
            row3.isEmpty &&
            kpi.isEmpty &&
            kpiCaption.isEmpty &&
            cardBody.isEmpty &&
            action.isEmpty &&
            secondaryAction.isEmpty
    }
}

extension CardExtHeader: _ViewEmptyChecking {
    public var isEmpty: Bool {
        row1.isEmpty &&
            row2.isEmpty &&
            row3.isEmpty &&
            kpi.isEmpty &&
            kpiCaption.isEmpty
    }
}

extension CardFooter: _ViewEmptyChecking {
    public var isEmpty: Bool {
        action.isEmpty &&
            secondaryAction.isEmpty
    }
}

extension CardHeader: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mediaImage.isEmpty &&
            description.isEmpty &&
            title.isEmpty &&
            subtitle.isEmpty &&
            icons.isEmpty &&
            detailImage.isEmpty &&
            headerAction.isEmpty &&
            counter.isEmpty &&
            row1.isEmpty &&
            row2.isEmpty &&
            row3.isEmpty &&
            kpi.isEmpty &&
            kpiCaption.isEmpty
    }
}

extension CardMainHeader: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty &&
            subtitle.isEmpty &&
            icons.isEmpty &&
            detailImage.isEmpty &&
            headerAction.isEmpty &&
            counter.isEmpty
    }
}

extension CardMedia: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mediaImage.isEmpty &&
            description.isEmpty
    }
}

extension Counter: _ViewEmptyChecking {
    public var isEmpty: Bool {
        counter.isEmpty
    }
}

extension DecrementAction: _ViewEmptyChecking {
    public var isEmpty: Bool {
        decrementAction.isEmpty
    }
}

extension DemoView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty &&
            subtitle.isEmpty &&
            status.isEmpty &&
            action.isEmpty
    }
}

extension Description: _ViewEmptyChecking {
    public var isEmpty: Bool {
        description.isEmpty
    }
}

extension DetailImage: _ViewEmptyChecking {
    public var isEmpty: Bool {
        detailImage.isEmpty
    }
}

extension FilledIcon: _ViewEmptyChecking {
    public var isEmpty: Bool {
        filledIcon.isEmpty
    }
}

extension Footnote: _ViewEmptyChecking {
    public var isEmpty: Bool {
        footnote.isEmpty
    }
}

extension FootnoteIcons: _ViewEmptyChecking {
    public var isEmpty: Bool {
        footnoteIcons.isEmpty
    }
}

extension FormView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        false
    }
}

extension GreetingText: _ViewEmptyChecking {
    public var isEmpty: Bool {
        greetingText.isEmpty
    }
}

extension HeaderAction: _ViewEmptyChecking {
    public var isEmpty: Bool {
        headerAction.isEmpty
    }
}

extension HelperText: _ViewEmptyChecking {
    public var isEmpty: Bool {
        helperText.isEmpty
    }
}

extension Icon: _ViewEmptyChecking {
    public var isEmpty: Bool {
        icon.isEmpty
    }
}

extension Icons: _ViewEmptyChecking {
    public var isEmpty: Bool {
        icons.isEmpty
    }
}

extension IllustratedMessage: _ViewEmptyChecking {
    public var isEmpty: Bool {
        detailImage.isEmpty &&
            title.isEmpty &&
            description.isEmpty &&
            action.isEmpty
    }
}

extension IncrementAction: _ViewEmptyChecking {
    public var isEmpty: Bool {
        incrementAction.isEmpty
    }
}

extension InformationView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        icon.isEmpty &&
            description.isEmpty
    }
}

extension JouleWelcomeScreen: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mediaImage.isEmpty &&
            greetingText.isEmpty &&
            title.isEmpty &&
            footnote.isEmpty &&
            messageContent.isEmpty
    }
}

extension KeyValueFormView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty &&
            placeholder.isEmpty &&
            mandatoryFieldIndicator.isEmpty
    }
}

extension KpiCaption: _ViewEmptyChecking {
    public var isEmpty: Bool {
        kpiCaption.isEmpty
    }
}

extension Kpi: _ViewEmptyChecking {
    public var isEmpty: Bool {
        kpi.isEmpty
    }
}

extension LabelItem: _ViewEmptyChecking {
    public var isEmpty: Bool {
        icon.isEmpty &&
            title.isEmpty
    }
}

extension LinearProgressIndicator: _ViewEmptyChecking {
    public var isEmpty: Bool {
        false
    }
}

extension LinearProgressIndicatorView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        icon.isEmpty &&
            description.isEmpty
    }
}

extension MandatoryFieldIndicator: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mandatoryFieldIndicator.isEmpty
    }
}

extension MediaImage: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mediaImage.isEmpty
    }
}

extension MessageContent: _ViewEmptyChecking {
    public var isEmpty: Bool {
        messageContent.isEmpty
    }
}

extension MoreActionOverflow: _ViewEmptyChecking {
    public var isEmpty: Bool {
        moreActionOverflow.isEmpty
    }
}

extension NoteFormView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        placeholder.isEmpty
    }
}

extension ObjectItem: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty &&
            subtitle.isEmpty &&
            footnote.isEmpty &&
            description.isEmpty &&
            status.isEmpty &&
            substatus.isEmpty &&
            detailImage.isEmpty &&
            icons.isEmpty &&
            avatars.isEmpty &&
            footnoteIcons.isEmpty &&
            tags.isEmpty &&
            action.isEmpty
    }
}

extension Placeholder: _ViewEmptyChecking {
    public var isEmpty: Bool {
        placeholder.isEmpty
    }
}

extension PlaceholderTextEditor: _ViewEmptyChecking {
    public var isEmpty: Bool {
        placeholder.isEmpty
    }
}

extension PlaceholderTextField: _ViewEmptyChecking {
    public var isEmpty: Bool {
        placeholder.isEmpty
    }
}

extension Row1: _ViewEmptyChecking {
    public var isEmpty: Bool {
        row1.isEmpty
    }
}

extension Row2: _ViewEmptyChecking {
    public var isEmpty: Bool {
        row2.isEmpty
    }
}

extension Row3: _ViewEmptyChecking {
    public var isEmpty: Bool {
        row3.isEmpty
    }
}

extension SecondaryAction: _ViewEmptyChecking {
    public var isEmpty: Bool {
        secondaryAction.isEmpty
    }
}

extension SideBar: _ViewEmptyChecking {
    public var isEmpty: Bool {
        footer.isEmpty &&
            editButton.isEmpty
    }
}

extension SideBarListItem: _ViewEmptyChecking {
    public var isEmpty: Bool {
        icon.isEmpty &&
            filledIcon.isEmpty &&
            title.isEmpty &&
            subtitle.isEmpty &&
            accessoryIcon.isEmpty
    }
}

extension Status: _ViewEmptyChecking {
    public var isEmpty: Bool {
        status.isEmpty
    }
}

extension StepperField: _ViewEmptyChecking {
    public var isEmpty: Bool {
        decrementAction.isEmpty &&
            incrementAction.isEmpty
    }
}

extension StepperView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty &&
            decrementAction.isEmpty &&
            incrementAction.isEmpty &&
            icon.isEmpty &&
            description.isEmpty
    }
}

extension Substatus: _ViewEmptyChecking {
    public var isEmpty: Bool {
        substatus.isEmpty
    }
}

extension Subtitle: _ViewEmptyChecking {
    public var isEmpty: Bool {
        subtitle.isEmpty
    }
}

extension Switch: _ViewEmptyChecking {
    public var isEmpty: Bool {
        false
    }
}

extension Tags: _ViewEmptyChecking {
    public var isEmpty: Bool {
        tags.isEmpty
    }
}

extension TextFieldFormView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty &&
            placeholder.isEmpty &&
            mandatoryFieldIndicator.isEmpty
    }
}

extension TextInputField: _ViewEmptyChecking {
    public var isEmpty: Bool {
        false
    }
}

extension TextInputInfoView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        icon.isEmpty &&
            description.isEmpty &&
            counter.isEmpty
    }
}

extension TextView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        false
    }
}

extension Title: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty
    }
}

extension TitleFormView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        placeholder.isEmpty
    }
}
