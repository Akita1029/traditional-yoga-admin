import React, { useEffect, useState } from "react";
import { useHistory } from "react-router-dom";

const Navdata = () => {
    const history = useHistory();
    //state data
    const [isLms, setIsLms] = useState(false);
    const [isUser, setIsUser] = useState(false);

    const [iscurrentState, setIscurrentState] = useState('LMS');

    function updateIconSidebar(e) {
        if (e && e.target && e.target.getAttribute("subitems")) {
            const ul = document.getElementById("two-column-menu");
            const iconItems = ul.querySelectorAll(".nav-icon.active");
            let activeIconItems = [...iconItems];
            activeIconItems.forEach((item) => {
                item.classList.remove("active");
                var id = item.getAttribute("subitems");
                if (document.getElementById(id))
                    document.getElementById(id).classList.remove("show");
            });
        }
    }

    useEffect(() => {
        document.body.classList.remove('twocolumn-panel');
        if (iscurrentState !== 'LMS') {
            setIsLms(false);
        }
        if (iscurrentState !== 'Users') {
            setIsUser(false);
        }
    }, [
        history,
        iscurrentState,
        isLms,
        isUser,
    ]);

    const menuItems = [
        {
            id: "lms",
            label: "LMS",
            icon: "las la-tachometer-alt",
            link: "/#",
            stateVariables: isLms,
            click: function (e) {
                e.preventDefault();
                setIsLms(!isLms);
                setIscurrentState('LMS');
                updateIconSidebar(e);
            },
            subItems: [
                {
                    id: "callCourses",
                    label: "Courses",
                    link: "/courses",
                    parentId: "lms",
                },
                {
                    id: "allUnits",
                    label: "Units",
                    link: "/units",
                    parentId: "lms",
                },
                {
                    id: "allQuiz",
                    label: "Quizzes",
                    link: "/quiz",
                    parentId: "lms",
                },
                {
                    id: "allQuestions",
                    label: "Questions",
                    link: "/question",
                    parentId: "lms",
                },
                {
                    id: "allAssignments",
                    label: "Assignments",
                    link: "/assignment",
                    parentId: "lms",
                },
                {
                    id: "certificateTemplates",
                    label: "Certificate Templates",
                    link: "/certiifcate-template",
                    parentId: "lms",
                },
            ],
        },
    ];
    return <React.Fragment>{menuItems}</React.Fragment>;
};
export default Navdata;
