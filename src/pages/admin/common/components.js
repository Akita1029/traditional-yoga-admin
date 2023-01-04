import React from "react"
import { Col, Input, Label, Row } from "reactstrap"
import '../../../assets/scss/global.css'

const DurationParamPicker = ({onParamChanged, value}) => {
    return (
        <>
            <select className="form-select" data-choices data-choices-search-false
                id="choices-status-input" onChange={() => onParamChanged()} value={value}>
                <option value="seconds">Seconds</option>
                <option value="minutes">Minutes</option>
                <option value="hours">Hours</option>
                <option value="days">Days</option>
                <option value="months">Months</option>
                <option value="years">Years</option>
            </select>
        </>
    )
}

const SwitchEx = ({title, summary, key}) => {
    return (
        <Row className="mt-3">
            <Col sm={4} className="align-items-center">
                <Label className="form-check-label" htmlFor={key}>{title}</Label>
            </Col>
            <Col sm={8}>
                <div className="form-check form-switch form-switch-lg" dir="ltr">
                    <Input type="checkbox" className="form-check-input" id={key} defaultChecked="" />
                </div>
                <Label className="switch-summary">{summary}</Label>
            </Col>
        </Row>
    )
}

export {DurationParamPicker, SwitchEx}